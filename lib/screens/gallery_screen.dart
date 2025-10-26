import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_alert.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_progress.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String description,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: children,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Componentes"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // Botones
            _buildSection(
              title: "CustomButton",
              icon: Icons.smart_button,
              description: "Botones con diferentes estilos y variantes",
              children: const [
                CustomButton(text: "Primary", variant: ButtonVariant.primary),
                CustomButton(
                    text: "Secondary", variant: ButtonVariant.secondary),
                CustomButton(text: "Outlined", variant: ButtonVariant.outlined),
              ],
            ),

            // Tarjetas
            _buildSection(
              title: "CustomCard",
              icon: Icons.credit_card,
              description: "Tarjetas con diferentes estilos",
              children: const [
                CustomCard(
                  variant: CardVariant.elevated,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Elevated Card"),
                  ),
                ),
                CustomCard(
                  variant: CardVariant.outlined,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Outlined Card"),
                  ),
                ),
                CustomCard(
                  variant: CardVariant.filled,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Filled Card"),
                  ),
                ),
              ],
            ),

            // Avatares
            _buildSection(
              title: "CustomAvatar",
              icon: Icons.account_circle,
              description: "Avatares con diferentes formas",
              children: const [
                CustomAvatar(
                    initials: "AB",
                    variant: AvatarVariant.circular,
                    size: 50),
                CustomAvatar(
                    initials: "CD",
                    variant: AvatarVariant.rounded,
                    size: 50),
                CustomAvatar(
                    initials: "EF",
                    variant: AvatarVariant.square,
                    size: 50),
              ],
            ),

            // Badges
            _buildSection(
              title: "CustomBadge",
              icon: Icons.badge,
              description: "Etiquetas de estado o información",
              children: const [
                CustomBadge(text: "Info", variant: BadgeVariant.info),
                CustomBadge(text: "Success", variant: BadgeVariant.success),
                CustomBadge(text: "Warning", variant: BadgeVariant.warning),
                CustomBadge(text: "Error", variant: BadgeVariant.error),
              ],
            ),

            // Chips
            _buildSection(
              title: "CustomChip",
              icon: Icons.label,
              description: "Chips para selección o filtrado",
              children: const [
                CustomChip(label: "Default", variant: ChipVariant.defaultChip),
                CustomChip(label: "Outlined", variant: ChipVariant.outlined),
                CustomChip(label: "Colored", variant: ChipVariant.colored),
              ],
            ),

            // Alerts
            _buildSection(
              title: "CustomAlert",
              icon: Icons.notification_important,
              description: "Alertas con diferentes variantes",
              children: const [
                CustomAlert(
                    message: "Información",
                    variant: AlertVariant.info,
                ),
                CustomAlert(
                    message: "Éxito",
                    variant: AlertVariant.success,
                ),
                CustomAlert(
                    message: "Advertencia",
                    variant: AlertVariant.warning,
                ),
                CustomAlert(
                    message: "Error",
                    variant: AlertVariant.error,
                ),
              ],
            ),

            // Inputs
            _buildSection(
              title: "CustomInput",
              icon: Icons.input,
              description: "Campos de texto personalizados",
              children: const [
                CustomInput(
                    hintText: "Standard",
                    variant: InputVariant.standard
                ),
                CustomInput(
                    hintText: "Outlined",
                    variant: InputVariant.outlined
                ),
                CustomInput(
                    hintText: "Filled",
                    variant: InputVariant.filled
                ),
              ],
            ),

            // Progress
            _buildSection(
              title: "CustomProgress",
              icon: Icons.timeline,
              description: "Indicadores de progreso",
              children: const [
                CustomProgress(
                    value: 0.7,
                    variant: ProgressVariant.linear,
                ),
                CustomProgress(
                    value: 0.5,
                    variant: ProgressVariant.circular,
                ),
                CustomProgress(
                    value: 0.8,
                    variant: ProgressVariant.custom,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
