Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476526;
	b=zoj/raAU0oo5f9WMaxD1fedDHSHF/gfo2tWroKdR4eIvPuxbZmYKJwYXyNHGhsSm5wJu
	 5LWzvsKc5mdkkQ6ADGgGXOHSmGkhrsnk4Nu5AgqD/5fFU+yPoJTIl9SDl3WjmedrYXxuf
	 VHc7bCoDs7wYFsBtyDvaFFiTkYUh/HwFgs5Ur2p2Y+rYcLm9kSkxIl99eZSBVmW7TgFxS
	 fVTAiAloQJYicfUqwFDjz/5TTZXCVtV60TcZqjJP1JiS7rLv/MWOSXNaEcfu0PwbrrQUK
	 nNMmTQhYcVztxjU94NPLrtrk4kmHUmZibsbeXkWXNi8NI2Y6HHF6URHhAm1JIU7Zc3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bKupv4Zo0Go6M+vCBLl0876hJYAY+8komh2krb0ldtY=;
	b=Z7G74EfnrTn4ejno6jpdYjCX5An7+l9lKxVYFp/BmRhAFHaZqyZ3Fajw5QzsBV+rN3Y0
	 O2ohzYT8P8Qepoy0ImvtQtHqvJol+J8F01zplaFBg6LX6U9hhzPHvzHOBcqXn8+zslA1L
	 Nvzkx/rWWHV3hAUPtKq3hkHymI+lc8suGEtQaWSwyTML/MpTDAgGpcoqWHOrP7dgGGKIg
	 UwHVXybH9xF5IIw74rWyxjaPIean/R/kMnZ9BdsnWZIozwLnGpkFj26tzoLrvheE6qawT
	 rgN3hjp/LWKx4+kET2UDKQWzVinST+fyZWoO2xD/LR7SR4eETuErHkv9n4xf0EPbH9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lU0BE+Q3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD137606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD137606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lU0BE+Q3
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso44181801fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795476524; cv=none;
        d=google.com; s=arc-20260327;
        b=fk7X6gWrdC+J4Gfs779bT2VJ9+MSulgZUFLbFckKJUHMzYk+65h8b+GXYU2VS5Vmrc
         C9geniLXkTqv/Q+SSc1Pk37gqu5FRX87tu4EcqqGqly7e/hMiz/fVdVL0iAQiJ75w7qo
         R3LbqqII/ZLmrwca40dRu6JwfdfZpFH2Cz8sIwfNYCPliYviJ0ql+N9GPBwyn93cS4zG
         EOLZ3etXtYU5pVOnl1cZTuKp9RSw3rLJdqRBjcoQ3B9SgZ+GlaazUwA7QHh/8uZEiQrO
         BF+agTCQnCu3nxjbIPzL8iGVHxhWBL+mn9hQq7XEpROH7G2piIgBhIGh+hOjgbOmyQzh
         gbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKupv4Zo0Go6M+vCBLl0876hJYAY+8komh2krb0ldtY=;
        fh=aqECjYSmpi21LQtW212HpF596duvna2EHRHNcqGzE58=;
        b=se7dXQRujbvJaTGT3SOfwZY4B2qB4MS67pA4IImWHcneMjuPLJzXxPBbMWST5iLA8T
         5tCtDbBoqmraeSpFPfj49rGETCKqJLMQTReYwYsVpnOdpiW1Rlzz8kJyEpvyVbFoHoDw
         T3wwejAzVy9Rw0pcp6eGlhgTE2lA6+yjZUVNDTYxtH/q6NSzyT8u4xU25hZmbWwyDwMz
         11Q1bIFdD2PkvdEV8p9dbU9+1jWcK6IBC1wpIcL6jpJ2DyjEC7++sBSLs1QUN6tqObzi
         VtsOMFxNoRjkUTG4htZXap2w/fg7STWZu0c8T49PcV6kb2gvP10KWZCXhixsj2tLUNT0
         i1aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476524; x=1796081324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKupv4Zo0Go6M+vCBLl0876hJYAY+8komh2krb0ldtY=;
        b=lU0BE+Q3bH5XLU24Jo9BZ+d44+uKfA6vCmbyhboDEIzx8JnVdprBMFU3ueene7Fu9B
         B4aXzI5XOWxGlzbxPXM2PWc0caXgbtmQSsmtJfYHbWo7fzJ9qKapNQHNfQQiK4HYqrib
         oih2csHsVxnBJn2cApSbRvyQRGxiZKbg+7CbiXBMxZWr1NdLaFhtdoZOM6GiyxcYXdsL
         XZOl7bVNKbUGpj9uBH/sfcoGBpvVEsgNVXjMFnARYcWKA63SuPp/knTmr6D5LdUIEIFT
         km7CszZNNJurk3A4+EF69IN7FKx0FHyvvzIpDs6BEfcxeKYM68Mdm9JJZKij4kZ+p7Mh
         AMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476524; x=1796081324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKupv4Zo0Go6M+vCBLl0876hJYAY+8komh2krb0ldtY=;
        b=dcXbS6/pNgevGYMA9VRZNZPtQb9r5PpJe/1E6alo8kaJGJGNFIQgj4TdSuqt9+lwTO
         bXQTNBg1dEGNmjEyO5LL5NpRZxNzEC2WgpxiGBOp2uqEJ+e3nBjmjtTCKbQK5XZdR0mt
         lxpzG5Ba6/brC0wZfyw7a4W4zbsSKjUibyE/ud+KYUq5pQgFx7/lbMGCSSLLWSkX1kFa
         77CvMK6db0bgRPmO/trdKsBkmx8iDRPKEINQQrNsK5cYBOj9xPpa/3gDwXrKWdRMm2co
         U1M6orQymBT99vYRDg1vM2yQF0xAlb3zZDR4pB/TkxGsKHLI5NIpfoG2B3oPRsoFduDd
         HKCg==
X-Forwarded-Encrypted: i=1; AL+hErE1XbqBymexMZG/Ou101HmczYjbKxVG0SB4EFir3O3Rc/2teG2N+5jqM9BKyA8ZSk20an0ggHbElA7TloE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KD0LzT/09I/Cgnt4/ZBN6ciwYfPVYs2fXwYQL2Dm6WSjpCsBE
	lSqCurXm12DRqp7UK7KNAOPWQaeFfNWO+XzaESuKD3vT+xDXtzv93pfC7z9JwpCNyBgjkCTf+Ql
	afKEOmtOrVhp62PmxnjAn07CVX21rDbQ=
X-Gm-Gg: AZFdTZfefJcgGNSn+kkp/PqcboQL1Joo255xfnnPmshJncHCBezedg2Xt4OLKcuMYOB
	UNex64bt7kSfYsMWLYsbKRWOx6kaxZCJyBtT5jAlzBWI+T+OwFwbBmytl1N+dv+iPNnaOz6ixuq
	K3FpAYoKVieXicAQ1URRfgvQJ27RGMZvhhOin70bTgEFztdDbOOvb1xWHEWL56n7Njf64IGV0k2
	Srk8iNQQpI3iNPqZ2gqTn2hMXdR7mxrcGQ+scVuaD4x/YcIkofhZp5l3u1RPGEhNsesRqy3+MH8
	vsRMqefWcoegeMH921UocM7U8+tkyU2VXno2ZCBcO3cu4H9dLle9xrWiNxNII6nqr2kL0urBEHj
	xDwsLm6ci1SQuxvzOp+qmIRP4NaI7vYdL6IYuoelTCGHPkAArRpYr5D8jxg6JhmMqX3nOkfoDea
	9TVfJ0nZsWc0Vu11aVgPDy2daCjLlwvmsXue3IbEah2b1c2sqNWPBbYP7y5Uc=
X-Received: by 2002:a05:651c:a386:10b0:3ac:f9f5:c73 with SMTP id
 38308e7fff4ca-3af977f152amr209341fa.3.1795476523850; Mon, 23 Nov 2026
 15:28:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930002133.10794-1-vishnuocv@gmail.com> <CABxCQKsV49CKbvZ2m2556+P=+q-9DSMdanzXk_v-syzZ=uJ9WA@mail.gmail.com>
 <923f7e6e-3e1f-44a7-a3e3-6ef83c148db6@app.fastmail.com>
In-Reply-To: <923f7e6e-3e1f-44a7-a3e3-6ef83c148db6@app.fastmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 24 Nov 2026 08:28:05 +0900
X-Gm-Features: Aa3M54rsftTf6H8DJJpmAF_O-aFo7Zx7CANM618NF8ETZwdFZrVCw5c44AWUHHE
Message-ID: <CABxCQKv3xKs8S=JaFrbpHj0cZRjh7U3Ff2tfGaXqg1ZbfDM2rA@mail.gmail.com>
Subject: Re: [PATCH] HID: lenovo: add fn+F7 display switch support for X12 and
 X13 Folio
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Pearson <mpearson@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, Benjamin, Derek,

Gentle ping on this one - posted on Oct 21, and I have not had any
feedback yet.

It still applies to the current mainline and I have
retested on the X13 Detachable.
Is there anything you would like changed before this can be picked up,
or would you prefer that I resend it rebased as v3?

Mark - Thanks for the "Reviewed-by" tag.

Thanks,
Vishnu

On Fri, Oct 30, 2026 at 10:01=E2=80=AFPM Mark Pearson <mpearson-lenovo@sque=
bb.ca> wrote:
>
> Thanks Vishnu,
>
> On Mon, Oct 19, 2026, at 2:35 AM, Vishnu Sankar wrote:
> > Hi All,
> >
> > A gentle ping on this =E2=80=94 any feedback would be appreciated. Than=
ks!
> >
> > Vishnu
> >
> >
> > On Wed, Sep 30, 2026 at 9:22=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.=
com> wrote:
> >>
> >> On ThinkPad X12 and X13 detachable keyboards FN+F7 reports the Super+P
> >> key chord, which behaves differently from FN+F7 on other Thinkpads.
> >> In particular giving a shorter on screen display time making it harder
> >> for users to select their preferred display mode.
> >>
> >> Newer keyboard FW is now available, allowing the keyboard to be
> >> configured by the OS to provide the standard FN+F7 KEY_SWITCHVIDEOMODE
> >> code as used on other Thinkpads.
> >>
> >> Detect if the capability is present and enables the mode if available
> >> on initial probe and resume.
> >>
> >> Suggested-by: Mark Pearson <mpearson@squebb.ca>
> >> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> >> ---
> >>  drivers/hid/hid-lenovo.c | 71 +++++++++++++++++++++++++++++++++++++--=
-
> >>  1 file changed, 66 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> >> index 3976d7b53b14..6b4b689c8834 100644
> >> --- a/drivers/hid/hid-lenovo.c
> >> +++ b/drivers/hid/hid-lenovo.c
> >> @@ -44,6 +44,7 @@
> >>  #define TP_X12_RAW_HOTKEY_FN_F10       0x00000803
> >>  #define TP_X12_RAW_HOTKEY_FN_F12       0x00000403
> >>  #define TP_X12_RAW_HOTKEY_FN_SPACE     0x18001003
> >> +#define TP_X12_RAW_HOTKEY_FN_F7                0x00000815
> >>
> >>  struct lenovo_drvdata {
> >>         u8 led_report[3]; /* Must be first for proper alignment */
> >> @@ -557,6 +558,34 @@ static int lenovo_send_cmd_cptkbd(struct hid_devi=
ce *hdev,
> >>         return ret < 0 ? ret : 0; /* BT returns 0, USB returns sizeof(=
buf) */
> >>  }
> >>
> >> +/* X12/X13 folio Fn+F7 reporting mode: feature report 0xa4, [id, mode=
]. */
> >> +#define TP_X12_FEATURE_HOTKEY_MODE     0xa4
> >> +#define TP_X12_MODE_DEDICATED_HOTKEY   0x01
> >> +
> >> +/*
> >> + * Select how the X12/X13 detachable folio reports Fn+F7 (display swi=
tch):
> >> + * a dedicated vendor hotkey (report ID 0x15) instead of the default
> >> + * Super+P key chords.
> >> + */
> >> +static int lenovo_send_hotkey_mode_tp10ubkbd(struct hid_device *hdev,=
 u8 mode)
> >> +{
> >> +       unsigned char *buf;
> >> +       int ret;
> >> +
> >> +       buf =3D kzalloc(2, GFP_KERNEL);
> >> +       if (!buf)
> >> +               return -ENOMEM;
> >> +
> >> +       buf[0] =3D TP_X12_FEATURE_HOTKEY_MODE;
> >> +       buf[1] =3D mode;
> >> +
> >> +       ret =3D hid_hw_raw_request(hdev, TP_X12_FEATURE_HOTKEY_MODE, b=
uf, 2,
> >> +                                HID_FEATURE_REPORT, HID_REQ_SET_REPOR=
T);
> >> +
> >> +       kfree(buf);
> >> +       return ret < 0 ? ret : 0;
> >> +}
> >> +
> >>  static void lenovo_features_set_cptkbd(struct hid_device *hdev)
> >>  {
> >>         int ret;
> >> @@ -739,6 +768,10 @@ static int lenovo_raw_event_TP_X12_tab(struct hid=
_device *hdev, u32 raw_data)
> >>                 case TP_X12_RAW_HOTKEY_FN_F4:
> >>                         report_key_event(input, LENOVO_KEY_MICMUTE);
> >>                         return 1;
> >> +               case TP_X12_RAW_HOTKEY_FN_F7:
> >> +                       /* Fn-F7: switch/extend external display */
> >> +                       report_key_event(input, KEY_SWITCHVIDEOMODE);
> >> +                       return 1;
> >>                 /* Power-mode or Airplane mode will be called based on=
 the device*/
> >>                 case TP_X12_RAW_HOTKEY_FN_F8:
> >>                         /*
> >> @@ -794,11 +827,22 @@ static int lenovo_raw_event(struct hid_device *h=
dev,
> >>          * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Repo=
rt ID is 0x03
> >>          * e.g.: Raw data received for MIC mute is 0x00020003.
> >>          */
> >> -       if (unlikely((hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TA=
B ||
> >> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TA=
B2 ||
> >> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TA=
B) &&
> >> -                     size >=3D 4 && report->id =3D=3D 0x03))
> >> -               return lenovo_raw_event_TP_X12_tab(hdev, get_unaligned=
_le32(data));
> >> +       if (unlikely(hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB=
 ||
> >> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB=
2 ||
> >> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB=
)) {
> >> +               /* Existing 0x03 vendor hotkeys (8-byte). */
> >> +               if (size >=3D 4 && report->id =3D=3D 0x03)
> >> +                       return lenovo_raw_event_TP_X12_tab(hdev,
> >> +                               get_unaligned_le32(data));
> >> +
> >> +               /* Dedicated-mode display-switch (F7): 3-byte 0x15 rep=
ort. */
> >> +               if (report->id =3D=3D 0x15 && size >=3D 3) {
> >> +                       u8 pad[4] =3D { data[0], data[1], data[2], 0 }=
;
> >> +
> >> +                       return lenovo_raw_event_TP_X12_tab(hdev,
> >> +                                       get_unaligned_le32(pad));
> >> +               }
> >> +       }
> >>
> >>         return 0;
> >>  }
> >> @@ -1366,6 +1410,12 @@ static int lenovo_probe_tp10ubkbd(struct hid_de=
vice *hdev)
> >>
> >>         lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn=
_lock);
> >>
> >> +       if (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB ||
> >> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB2 ||
> >> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB)
> >> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
> >> +                                                 TP_X12_MODE_DEDICATE=
D_HOTKEY);
> >> +
> >>         ret =3D sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group=
_tp10ubkbd);
> >>         if (ret)
> >>                 return ret;
> >> @@ -1439,6 +1489,13 @@ static int lenovo_reset_resume(struct hid_devic=
e *hdev)
> >>                         lenovo_features_set_cptkbd(hdev);
> >>
> >>                 break;
> >> +       case USB_DEVICE_ID_LENOVO_X12_TAB:
> >> +       case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >> +       case USB_DEVICE_ID_LENOVO_X13_TAB:
> >> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
> >> +                                                 TP_X12_MODE_DEDICATE=
D_HOTKEY);
> >> +               break;
> >> +
> >>         default:
> >>                 break;
> >>         }
> >> @@ -1526,9 +1583,13 @@ static int lenovo_input_configured(struct hid_d=
evice *hdev,
> >>                                                 hi->input->propbit);
> >>                         }
> >>                         break;
> >> +               case USB_DEVICE_ID_LENOVO_X12_TAB:
> >> +                       input_set_capability(hi->input, EV_KEY, KEY_SW=
ITCHVIDEOMODE);
> >> +                       break;
> >>                 case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >>                 case USB_DEVICE_ID_LENOVO_X13_TAB:
> >>                         input_set_capability(hi->input, EV_KEY, KEY_PE=
RFORMANCE);
> >> +                       input_set_capability(hi->input, EV_KEY, KEY_SW=
ITCHVIDEOMODE);
> >>                         break;
> >>         }
> >>
> >> --
> >> 2.55.0
> >>
> >
>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Mark
>


--=20

Regards,

      Vishnu Sankar
