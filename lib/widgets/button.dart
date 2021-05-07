import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/progress.dart';

class RegisterButton extends StatefulWidget {
  final String text;
  final double padding;
  final bool loading;
  final double radius;
  final FocusNode focus;
  final Color color;
  final Function action;
  @override
  _RegisterButtonState createState() => _RegisterButtonState();

  RegisterButton(this.text, this.action,
      {this.padding,
      this.loading = false,
      this.radius = 12,
      this.color,
      this.focus});
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: AbsorbPointer(
        absorbing: widget.loading,
        child: InkWell(
          focusNode: widget.focus,
          onTap: () async {
            await widget.action();
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: widget.color,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: widget.loading == true
                  ? circularProgress(context, color: Colors.white)
                  : Center(
                      child: Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppIconButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final double padding;
  final bool loading;
  final double radius;
  final FocusNode focus;
  final Color color;
  final Function action;
  @override
  _AppIconButtonState createState() => _AppIconButtonState();

  AppIconButton(this.text, this.action,
      {this.padding,
      this.loading = false,
      this.radius = 45,
      this.color,
      this.icon,
      this.focus});
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: AbsorbPointer(
        absorbing: widget.loading,
        child: TextButton.icon(
          focusNode: widget.focus,
          onPressed: () async {
            await widget.action();
          },
          icon: Icon(
            widget.icon,
            color: Colors.white,
          ),
          label: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(
                double.infinity,
                50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutlinedButtonApp extends StatefulWidget {
  final String text;
  final Color color;
  final bool loading;
  final double padding;
  final FocusNode focus;
  final Function action;
  @override
  _OutlinedButtonAppState createState() => _OutlinedButtonAppState();

  OutlinedButtonApp(
      {this.text,
      this.action,
      this.color,
      this.padding,
      this.loading = false,
      this.focus});
}

class _OutlinedButtonAppState extends State<OutlinedButtonApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: AbsorbPointer(
        absorbing: widget.loading,
        child: InkWell(
          focusNode: widget.focus,
          onTap: () => widget.action(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: widget.color),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Center(
              child: Container(
                height: 50,
                child: widget.loading == true
                    ? circularProgress(context, color: Colors.white)
                    : Center(
                        child: Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(color: widget.color),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String text;
  final Color color;
  final double padding;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action(),
      child: Container(
        height: 50,
        width: padding,
        constraints: BoxConstraints.tightFor(width: padding, height: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display1.copyWith(color: color),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  LanguageButton({this.text, this.action, this.color, this.padding});
}

class AppAddButton extends StatefulWidget {
  final String text;
  final Function action;
  @override
  _AppAddButtonState createState() => _AppAddButtonState();

  AppAddButton(this.text, this.action);
}

class _AppAddButtonState extends State<AppAddButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: FlatButton(
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ((MediaQuery.of(context).size.width * 0.3) / 2),
                vertical: 12),
            child: loading
                ? FittedBox(
                    child: circularProgress(context,
                        color: Colors.white, size: 20.0),
                  )
                : Text(
                    widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.white),
                  ),
          ),
          onPressed: () async {
            setState(() {
              loading = true;
            });
            await widget.action();
            if (context != null) {
              setState(() {
                loading = false;
              });
            }
          }),
    );
  }
}
