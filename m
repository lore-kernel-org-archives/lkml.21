Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181764;
	b=RZw4F/hsLZyy33CNZso6FoAb4lEyfIXCskVuMgkJ43NiTCLxbcnTHkKjOdpbwuYC5CDU
	 8zy4YaPxTJ8UOXo9N6HseCUV/pVSnymW98DIfp5DhkLlX/17AVXl3hVWn27BY1crebmzE
	 Yhw/AE+GupoQwXZmOlfH0eiIsS24joj7SUUzva6ptDn5tFM/RbcvAtCXw+8yweARu7V8N
	 k9sOtj7mBy1t2lMsHGOtYTs664cNWdjZujfkqcSQAde8hTmJPe8G7oOKeJ4itnx405nHl
	 CZAnJLfzrJsfuIe+rDQGrTSsz9wGTuAAfhd1FqUKEQ+PczgQznayy39glpQ9KPulR0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181764;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8mOYf+AbRXOXxOUFh4yUzyTj5m1ShqxsmCA67iovdOA=;
	b=KYEoi0EMfCo85rXvYfnfLsaejrY9It+6jV4ZUaoPdw2gmEpiQYTc6PhjOdy3kBWSePFX
	 puQMfdmPzIDKb7BVFgVKTNoDSuhmsaXQ9AyJvAWNxQvkeuLtzujK4dZK2liuJVAI6vSCM
	 Hnm2lpaUBUmwXGPdo68lDBHYpMuce13CJZL2ZxQ3QqkzpQqONSE0jX527VtyK9LTSn7Ju
	 8vdlb9KRHPd/Wo4I63dCkpgUOsDcQR+7gDTflkhCP4bzD+1GXziqHUnk4n36qtS/C5Hsc
	 NnYg4ePD864D9fu9qMrk0ohK5J0fne0jpondeX10jtQoCLyoV6MHZCXT60QtGxwEU8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsjFhdxo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50FF606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsjFhdxo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654821F000C6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181764;
	bh=8mOYf+AbRXOXxOUFh4yUzyTj5m1ShqxsmCA67iovdOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hsjFhdxowePlLQ32etwnNVW2/Hmnb6MdimSCd5pmhjumUJE3Ia2ua4ThLicEs2dBV
	 1tpUxQaXmvTKisIXJ8PtaNGJkCOdYjzo3Wo/sNEzCp5kdATIShzwcCAbgnJn8FGAAt
	 MmF9ggTbm5/pKeIeDZRDqGkb+lwqVcQvxdOnMfSjWp9Qzfi9DRqAxMi1un3gipkN1/
	 ZjAwrZnP5ZUbgbYUZp/zbpROqS520VIBMIzLXGe4bdyfmecZXV8upILQOeXQAVy3CT
	 slzxlKiVh272KxdiZKO/DNC7SqAFjxI1EkiF/2QO+k1if3wnlifXIpX4Y+SxapXEH6
	 XIKu/6sEsjTqQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso816021e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:36:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHfQYmPXB4VJLF7ZmpfiI58V6xnBLlFmt94wKEDCJMNWFA/uhvOD58/QS7yRp/luoNz6oyxTSCtmUPmBr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PyCoitWYvkZz+6riRpYH8CBlGw2N06JRJdlJbLykk+Jh1U9XN
	kozh7yuvmB+sGP1IOT4iR5ou0XDiVR6rpDQ8bMgNpQhaberu57igPT7zkpI5MqafQuCKHItsyVM
	14gPmhfs3CJ3u8yBcvoSOQNgvukOqvpI=
X-Received: by 2002:a05:6512:4016:b0:5bf:b74b:3fb8 with SMTP id
 2adb3069b0e04-5c1bc7cef09mr1001251e87.22.1795181762783; Fri, 20 Nov 2026
 05:36:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116102752.520062-1-uajain@igalia.com> <20261116102752.520062-2-uajain@igalia.com>
In-Reply-To: <20261116102752.520062-2-uajain@igalia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 14:35:50 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hu=6CxHc4LiUvX=82-St=xjLCtdgHZr_0iobnpbfLRuQ@mail.gmail.com>
X-Gm-Features: Aa3M54r1Lp_ZAHAGfrO_uaRS6L8PCjvgqwjba0CQcx6So78EsrJn0uxUKOpWFv8
Message-ID: <CAJZ5v0hu=6CxHc4LiUvX=82-St=xjLCtdgHZr_0iobnpbfLRuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] acpi: battery: Read Battery charge time("_BCT")
 for Steamdeck devices
To: Umang Jain <uajain@igalia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Umang Jain <uajain@igalia.com> wro=
te:
>
> Valve steamdeck devices can report battery status as
> charging, even when low-powered power supply is connected
> to the device. The battery status is reported as charging
> through sysfs, even though in reality, it is discharging.
>
> To address this, introduce a battery quirk for Valve Steamdeck devices
> ACPI_BATTERY_QUIRK_VALVE_STEAMDECK. This is required to detect
> if a low-power supply unit is connected to the device.
> To handle this case, read out Battery charge time ("_BCT")
> as it is reported accurately on these devices and use that
> information for report charging vs discharging status.
> Battery charge time ("_BCT") with an eligible power supply unit
> will have valid values whereas with a low-powered supply unit,
> it shall report ACPI_BATTERY_VALUE_UNKNOWN. Use this as a
> differentiator to determine, whether the battery of steamdeck
> devices is really charging or not.
>
> Signed-off-by: Umang Jain <uajain@igalia.com>

Sashiko has feedback on this:

https://sashiko.dev/#/patchset/20261116102752.520062-1-uajain%40igalia.com

Please let me know what you think about it.

> ---
>  drivers/acpi/battery.c | 49 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index 6edea559a5bc..458c2b23a05a 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -94,6 +94,15 @@ enum {
>          * on a full charge, but showing degradation in full charge cap.
>          */
>         ACPI_BATTERY_QUIRK_DEGRADED_FULL_CHARGE,
> +       /*
> +        * Valve steamdeck devices can get discharged even when battery s=
tatus
> +        * is charging. This happens typically when low power supply unit=
 is
> +        * connected. To accurately determine this scenario, we shall rea=
d
> +        * battery charge time ("_BCT") and set this quirk. This is the k=
ey
> +        * differentiator to determine whether the steamdeck is actually
> +        * charging or not.
> +        */
> +       ACPI_BATTERY_QUIRK_VALVE_STEAMDECK,
>  };
>
>  struct acpi_battery {
> @@ -234,7 +243,7 @@ static int acpi_battery_get_property(struct power_sup=
ply *psy,
>                                         : POWER_SUPPLY_STATUS_DISCHARGING=
;
>                                 return 0;
>                         }
> -               else if (battery->state & ACPI_BATTERY_STATE_CHARGING)
> +               else if (battery->state & ACPI_BATTERY_STATE_CHARGING) {
>                         /* Check the rate and capacity to validate the st=
atus. */
>                         if (!acpi_battery_is_full(battery) ||
>                             (battery->rate_now !=3D ACPI_BATTERY_VALUE_UN=
KNOWN &&
> @@ -244,6 +253,27 @@ static int acpi_battery_get_property(struct power_su=
pply *psy,
>                                 /* Full and zero rate. */
>                                 val->intval =3D POWER_SUPPLY_STATUS_NOT_C=
HARGING;
>                         }
> +
> +                       if (test_bit(ACPI_BATTERY_QUIRK_VALVE_STEAMDECK, =
&battery->flags)) {
> +                               unsigned long long bct;
> +                               acpi_status status;
> +                               union acpi_object arg0 =3D { ACPI_TYPE_IN=
TEGER };
> +                               struct acpi_object_list args =3D { 1, &ar=
g0 };
> +
> +                               arg0.integer.value =3D 100;
> +                               status =3D acpi_evaluate_integer(battery-=
>device->handle, "_BCT",
> +                                                              &args, &bc=
t);
> +                               if (ACPI_FAILURE(status))
> +                                       acpi_handle_debug(battery->device=
->handle,
> +                                                         "_BCT evaluatio=
n failed: %s",
> +                                                         acpi_format_exc=
eption(status));
> +                               else if (bct > ACPI_UINT32_MAX)
> +                                       acpi_handle_debug(battery->device=
->handle,
> +                                                         "_BCT value is =
invalid");
> +                               else if (bct =3D=3D ACPI_BATTERY_VALUE_UN=
KNOWN)
> +                                       val->intval =3D POWER_SUPPLY_STAT=
US_DISCHARGING;
> +                       }
> +               }
>                 else if (battery->state & ACPI_BATTERY_STATE_CHARGE_LIMIT=
ING)
>                         val->intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
>                 else if (acpi_battery_is_charged(battery))
> @@ -1150,6 +1180,23 @@ static void acpi_battery_quirks(struct acpi_batter=
y *battery)
>                 set_bit(ACPI_BATTERY_QUIRK_DEGRADED_FULL_CHARGE, &battery=
->flags);
>                 battery->capacity_now =3D battery->full_charge_capacity;
>         }
> +
> +       if (test_bit(ACPI_BATTERY_QUIRK_VALVE_STEAMDECK, &battery->flags)=
)
> +               return;
> +
> +       /*
> +        * For Valve Steamdeck devices, determine _BCT presence as well b=
efore
> +        * setting its battery quirk.
> +        */
> +       if (dmi_name_in_vendors("Valve") &&
> +           acpi_has_method(battery->device->handle, "_BCT")) {
> +               const char *name;
> +
> +               name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
> +               if ((name && (!strncmp("Jupiter", name, 7))) ||
> +                   (name && (!strncmp("Galileo", name, 7))))
> +                       set_bit(ACPI_BATTERY_QUIRK_VALVE_STEAMDECK, &batt=
ery->flags);
> +       }
>  }
>
>  static int acpi_battery_update(struct acpi_battery *battery, bool resume=
)
> --
> 2.55.0
>
