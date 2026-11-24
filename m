Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549164;
	b=zBZP3IcMVPguDPDNTVwGWXSRXegHIcfgrhJ9lm+WLrLMEWIPrrK+SuTcbTpXFwZZGdth
	 srwuYnP9/e1ABj1B8zgWjgGDXE20p2ILCaH/MbXrZPi02I+cS0rXPZrEYrP1LC93/DOqM
	 r9sAEsMfoQCNMAjT5RS8bRP+ooZKLzkgpE3vsGJCf6Tbwy1zr1QZJDginl/mfg3XpM64/
	 +p0kiYmMyk37sKTpdbJ/XsojvtTgv2u1y4dtC6FVRJqOHiz7eCbIGqd0riu9QXVENppGp
	 eF8Bj7lczjd0kmWmCZNZCY29OUnlzeZ/Qb5nwYPpVsFwy+Kiet98cx51Z015U/hA1Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
	b=y9eIHuun6PXQGm/XzEICUtNzi4gGxGwZSlM6cVcKsarQpuksNx/rTs+vmEqdiKBM1Y9c
	 2Y+1dXEOgpP4i9RH/BFIvLsChAU+Thulgfy0vUoknK0YjkaANydMQo9LHYEcb306BYIE1
	 Urz0HZjl4BxIyubjWV1Djt0/B5LvS2yIuOuU9Qe8cI/ICOO7fYdUxFV+UuIOcUy8Za6O3
	 Qw/MkMfq8btOBgSPwdcMePvlO69MYlzYBFCwZ9YZon/QN1LpOJ2heGZeP8RghJ/uY/0J2
	 j3LC1KbudbYiHwZ2KlACRrWwv6aIoKVPBRW3jH8E8xdwf+6H0Qg/avPeG4pOzzZzlcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cW2rwNVJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cW2rwNVJ
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ebf4cd218so40877826d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549163; cv=none;
        d=google.com; s=arc-20260327;
        b=A6vdp0v1mzF0ucTK35LsBo4N/ExHSvz1WLyOX2pgdsMA4NehN1CP1T7B5W3AFk6GCS
         ClqhVsCDi6jnUmHmm2TE2QjX1q7/PNgxdTb81EzP3c2O7fBAA6lv9GwpzYYkg9B4GD/q
         leOegj0QpxpXGpNKenHkqom9ACWeZ6Zz0h9ncG8MKNd1BtR1Nzpq3Y14GGX38jeuIkv5
         QftX++M1i3KmyhxogWJss5w6meB4JMJR+0f7nGMOCUKizVX1OlIi33WjF9qQRnQ0gFxA
         CnFQO8D0mbSjyfRDHJbcXZGSVW422mBVVaczXP21NF6Pk99lT7p7eCm75xyTfLwg4pxv
         fD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        fh=/r07GrCGTvIelScx84gqNfwRBVsGs5XW5Vi/EFhL9dk=;
        b=FK92/aYS8w8p37ZUY/fFMxlSnwvLZSzXZOSTStSjOuZCB5RE1cAymfZb0htB4cWyBF
         BZZPnkf6+bD8oRPN4d4m4P9JbBlUEmYKVG+7vJU0G/lMsOalSJUgW/e5vXLyK4QtNn54
         /qDI1eX4MBEpCEpcRGb0bMITgMA1Zy8hpU8DiCTMTfph4ud56OX52uMdipdeQtAJSZ1z
         94eJwm/g+SkM+2cF92zgA01ZYHlWMg6/JOU3YaxXFJwp2MrxNDXCqmOvLrRkOzIROCoN
         v/dV7T/9YIt4VWM7YEVDEBexXb6EqAfg5OVKr40gYuOO4pbvQ1rFGG59H7WO7V2n5nVr
         nzfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549162; x=1796153962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        b=cW2rwNVJI6HxHt+wItMR2czZyFM8ow0B06BcI45fbba+VQFvn1Z0TXpWSTRRWCwRZe
         8T60OJmWcm5C+mon3iZZDG6m2QDYKL0T1i8+sFCuPN0jVqjgomqe3HEQSH9fXycJ+GG9
         alRSQ4xAVZwqaC/6LzbYEREJ0M7v+pMFEguNQs4Qwq7HONhVTapJ/XnaQEZgsMn/P4SL
         aA6rG2RZG5qRTRrQ+4C/uRkiS1FSOIwgFHPuU8wi3u69EWkim6F7ZHAZzD6gnPLaZdrl
         BxKkIaD+i9B1PaXiYnydaY96GoTsMjJkvMnhAXVtuccblVLlQVvz5p9cLpKDEJ98Q5pk
         pszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549163; x=1796153963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wu6tXx6YfE7l4Mva2JR2OLNsbHXUq95QfytVnLKi2kk=;
        b=f5H7yQYloC3tE7AQVkkkKLDOWBU8iBx7WL2d1psQ+6l5DdK9gk2elR2dm4+nTp6d1K
         AO0v2BbHAfSMwLLRC3zrPczOwbi7kj28Az0b7pXm9sf3qoyA1bZR0Jc+jSZYiuW5vjIa
         4m4XgkQEb7EapSA5GBqFt3kfirKwfNzWhhVy5SHbBXGi2f69Ac20xPtfIT7MGYNu34yn
         3QpuvDGEJyem1CmZTL2aAeyeunKDR4uM8RFU+CY2izRaWQPaGD1c5g3lM/+oQMGL1nii
         amhkAy+hNQIA62C91YYX6HwJydLct6jJXRJojiugkSCd12usAfctEmchNptci1XOwb2V
         KNjg==
X-Forwarded-Encrypted: i=1; AL+hErG4zC9awMS9CIuKLINoIPofg+E8yaW2UEQC5hlUo1rkPDzo/+h9DLVly5xvtrLhqGJhjcqNNoqJCR2B2Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PcdVxjpRKL5+lo0BTz5vIZumCxXc01wKzgNFPAV0POPgTECdG
	3PW6n5zIG47WEP5Q5b9F+hIco+JCIew9N7He+cvzi5Q7lFQSjyxe62ZAGIRDByVu8UINIqdWxQN
	UwNfLTbVX7uW6UNqfnvJd79ETOZIn0xM=
X-Gm-Gg: AZFdTZcTxID5QnwT6YvYwmKrW+OjNcxT5mn5yujVQXuY8rIc+PaTs11zHhHSfq+9TJx
	hnUBQBSWOUbkHOLfQ/hpqLIxfvwMlcUs1X34g5pyEwXU6yD/sETjnyMjKHRYA0XBfcAOs/Ow9zJ
	5eGwFkyvnZzeamd5zJslP/OSfidrSwUF0ITncnkDUwjpnPItT8P3pudfz2MIvbtfy1A+ddCD2kb
	CC/ps+CQ64sSfefC6D16PIcL9X4refNdqy2atBACDF0W1+veD/0TD4OfeBx7XrtZNcLmSYORR+E
	kBms/DLpb3QETB/LANBR376w/ECVpeoZ3NFBlyl7gbr/EVF6RKQrGWaeh1FwXCrIm8j4xnEvQ3y
	B1wrwmDefJzn6DSelsmqIEztFTO/HJZM1siFw
X-Received: by 2002:ad4:4ea5:0:b0:921:2a52:7961 with SMTP id
 6a1803df08f44-92134a69adfmr276073706d6.11.1795549162306; Tue, 24 Nov 2026
 11:39:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <20261110020632.4003499-4-svv@google.com>
 <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com>
In-Reply-To: <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 24 Nov 2026 11:39:11 -0800
X-Gm-Features: Aa3M54o2OOpleRkrCFNEdlqQD3MYtqXEWF3YvkJU9bfSOLKz15MuchopzE_T5qU
Message-ID: <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist
To: Siarhei Vishniakou <svv@google.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:29=E2=80=AFPM Jason Gerecke <killertofu@gmail.com=
> wrote:
>
> On Mon, Nov 9, 2026 at 6:21=E2=80=AFPM Siarhei Vishniakou <svv@google.com=
> wrote:
> >
> > Historically, Wacom tablets reported stylus barrel rotation (twist)
> > via ABS_Z because a dedicated evdev axis did not exist. Now that we
> > have this axis, report pen twist on ABS_TWIST in addition to ABS_Z.
> >
> > Keep reporting ABS_Z to maintain backward compatibility for existing
> > applications that support Wacom devices.
> >
> > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > ---

Still waiting for the requested inline comments, but in the meantime
I've been able to test and verify that the code works as expected:

Tested-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> >  drivers/hid/wacom_wac.c | 35 +++++++++++++++++++++++++++++------
> >  1 file changed, 29 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > index 614f2adab563..7676bc26a027 100644
> > --- a/drivers/hid/wacom_wac.c
> > +++ b/drivers/hid/wacom_wac.c
> > @@ -802,8 +802,10 @@ static void wacom_exit_report(struct wacom_wac *wa=
com)
> >                 input_report_key(input, BTN_STYLUS2, 0);
> >                 input_report_key(input, BTN_TOUCH, 0);
> >                 input_report_abs(input, ABS_WHEEL, 0);
> > -               if (features->type >=3D INTUOS3S)
> > +               if (features->type >=3D INTUOS3S) {
> >                         input_report_abs(input, ABS_Z, 0);
> > +                       input_report_abs(input, ABS_TWIST, 0);
> > +               }
> >         }
> >         input_report_key(input, wacom->tool[idx], 0);
> >         input_report_abs(input, ABS_MISC, 0); /* reset tool id */
> > @@ -981,6 +983,7 @@ static int wacom_intuos_general(struct wacom_wac *w=
acom)
> >                         t =3D (data[7] & 0x20) ? ((t > 900) ? ((t-1) / =
2 - 1350) :
> >                                 ((t-1) / 2 + 450)) : (450 - t / 2) ;
> >                         input_report_abs(input, ABS_Z, t);
> > +                       input_report_abs(input, ABS_TWIST, t);
> >                 } else {
> >                         /* 4D mouse 2nd packet */
> >                         t =3D (data[6] << 3) | ((data[7] >> 5) & 7);
> > @@ -1411,6 +1414,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom=
_wac *wacom)
> >                                 input_report_abs(pen_input, ABS_TILT_Y,
> >                                                  (signed char)frame[8])=
;
> >                                 input_report_abs(pen_input, ABS_Z, rota=
tion);
> > +                               input_report_abs(pen_input, ABS_TWIST, =
rotation);
> >                                 input_report_abs(pen_input, ABS_WHEEL,
> >                                                  get_unaligned_le16(&fr=
ame[11]));
> >                         }
> > @@ -1935,7 +1939,7 @@ static void wacom_map_usage(struct input_dev *inp=
ut, struct hid_usage *usage,
> >         int resolution;
> >
> >         if (equivalent_usage =3D=3D HID_DG_TWIST) {
> > -               resolution_code =3D ABS_RZ;
> > +               resolution_code =3D ABS_TWIST;
> >         }
>
> Requesting a comment here just to make sure that anyone that is only
> casually reading doesn't think this code is dead. Setting *some* kind
> of radial axis here (be it ABS_RZ or ABS_TWIST) is critical to
> ensuring HID properly calculates the resolution for ABS_Z, and that
> might not be obvious when you see HID_DG_TWIST forcing the
> resolution_code to ABS_TWIST.
>
> >
> >         resolution =3D hidinput_calc_abs_res(field, resolution_code);
> > @@ -2332,6 +2336,7 @@ static void wacom_wac_pen_usage_mapping(struct hi=
d_device *hdev,
> >                 break;
> >         case HID_DG_TWIST:
>
> Also requesting a comment for this case that explains that the usage
> here is mapped twice for backwards-compatibility, and that the order
> matters since the latter call will override `usage->type` and
> `usage->code`, preventing wacom_wac_pen_event from automatically
> emitting an ABS_Z event.
>
> >                 wacom_map_usage(input, usage, field, EV_ABS, ABS_Z, 0);
> > +               wacom_map_usage(input, usage, field, EV_ABS, ABS_TWIST,=
 0);
> >                 break;
> >         case HID_DG_ERASER:
> >                 input_set_capability(input, EV_KEY, BTN_TOOL_RUBBER);
> > @@ -2522,10 +2527,21 @@ static void wacom_wac_pen_event(struct hid_devi=
ce *hdev, struct hid_field *field
> >                 return;
> >
> >         /* send pen events only when the pen is in range */
> > -       if (wacom_wac->hid_data.inrange_state)
> > -               input_event(input, usage->type, usage->code, value);
> > -       else if (wacom_wac->shared->stylus_in_proximity && !wacom_wac->=
hid_data.sense_state)
> > -               input_event(input, usage->type, usage->code, 0);
> > +       if (!wacom_wac->hid_data.inrange_state) {
> > +               if (!wacom_wac->shared->stylus_in_proximity ||
> > +                   wacom_wac->hid_data.sense_state)
> > +                       return;
> > +               value =3D 0;
> > +       }
> > +
> > +       input_event(input, usage->type, usage->code, value);
> > +       /*
> > +        * ABS_Z was used to report twist data, because ABS_TWIST was n=
ot yet
> > +        * defined at the time. For compatibility purposes, also report=
 twist
> > +        * via ABS_Z.
> > +        */
>
> I think this comment could be a little more clear, perhaps referencing
> the double-mapping in wacom_wac_pen_usage_mapping (and how we need to
> send data out of both ABS_TWIST and ABS_Z but that `usage->type` and
> `usage->code` can only be set to one of those two)
>
> Jason (she/they)
> ---
> Now instead of four in the eights place /
> you=E2=80=99ve got three, =E2=80=98Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can=E2=80=99t take seven from three,    /
> So you look at the sixty-fours....
>
> > +       if (equivalent_usage =3D=3D HID_DG_TWIST)
> > +               input_report_abs(input, ABS_Z, value);
> >  }
> >
> >  static void wacom_wac_pen_pre_report(struct hid_device *hdev,
> > @@ -3741,6 +3757,7 @@ void wacom_setup_device_quirks(struct wacom *waco=
m)
> >                 __clear_bit(BTN_TOOL_PENCIL, wacom_wac->pen_input->keyb=
it);
> >                 __clear_bit(BTN_TOOL_AIRBRUSH, wacom_wac->pen_input->ke=
ybit);
> >                 __clear_bit(ABS_Z, wacom_wac->pen_input->absbit);
> > +               __clear_bit(ABS_TWIST, wacom_wac->pen_input->absbit);
> >                 __clear_bit(ABS_DISTANCE, wacom_wac->pen_input->absbit)=
;
> >                 __clear_bit(ABS_TILT_X, wacom_wac->pen_input->absbit);
> >                 __clear_bit(ABS_TILT_Y, wacom_wac->pen_input->absbit);
> > @@ -3823,6 +3840,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >         case CINTIQ_COMPANION_2:
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >                 wacom_setup_cintiq(wacom_wac);
> >                 break;
> >
> > @@ -3835,6 +3854,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >         case INTUOS4S:
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >                 fallthrough;
> >
> >         case INTUOS:
> > @@ -3855,6 +3876,8 @@ int wacom_setup_pen_input_capabilities(struct inp=
ut_dev *input_dev,
> >
> >                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0)=
;
> >                 input_abs_set_res(input_dev, ABS_Z, 287);
> > +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0=
, 0);
> > +               input_abs_set_res(input_dev, ABS_TWIST, 287);
> >
> >                 wacom_setup_intuos(wacom_wac);
> >                 break;
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
> >
