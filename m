Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702170;
	b=HacgRx3nAhOu+XW8TN00oPZRljnzzNP5yKip3OzeIcGL1lxZwg74LHsinZ00GyHPeHoM
	 izYRUWCpjCbfrZx3nL9FlkeoW0gptzIJF/p7Ud1aqVuuewbLhn16/zZKYrRlSrP5fcnBE
	 PtLR4cCCEBbJo/XtcJDUAAjXfOItBKIdYI9eUZUtaJhP05lFGGu+2fni23y6GSDYKVi/J
	 0SCbCaeR0JqGmx/P5EAQ94ypQlolV41F8EMcN+W/w6hrqn1jz0t6MxCGHaHVHMSBPQN6Z
	 FjBPlFh6znt7E5U9XEQcSrSPT9Tlk515wF1RjiGKxcRlEnm80Kg+1VBnFJsmmsU/nUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7838JVCVIFZHpChcKzHUN7ifBcuei9XazkkD9p8QNFU=;
	b=2xlVm6kwDJkVclHHakWXzuGylMC02TXkV5kNhYEocy/NKHreycpH3kKcBCaF22Kyfdaq
	 0dMj3yzkdcq7NWWusWU2GPD9YRdmF25I9RkEUHLR03sQhq1RHJOShVNVnS2VG0QWkh4Qx
	 zeaIr3MZZ1WDql57e8nw9Lsegq7GsHvr5a7lMMqqlA0XO4mHS5f/ulpRLXN33F2V6JPBd
	 a16b7Pk9RSiLqMVPsJogLBvXnNEP3YFXWCO4Dl1n7K8zXxlUxI+KCiX2RYfh6SjTBuTXy
	 gchie+gGcTC2dXyePDFMc/bYTt7s/OSq5HkVBB5AdIJD06pEtQgw3CApoPutiXJTYeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d17URzsq;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911A606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9911A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d17URzsq
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2463557b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795702169; x=1796306969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7838JVCVIFZHpChcKzHUN7ifBcuei9XazkkD9p8QNFU=;
        b=d17URzsqjWioo2PfC+RopqBDvb9xyjHmxFcKjHWIro7dm6NbcxMmmXlubr2cgTEkXB
         OfihcCG9CbfADY6zZIChr14Lsls1UnnntuCfozzSDdqm2xfpx3LeOonsleuI36T1kVX9
         XiI8ddfYfBl+0jEtfH4kdWeW4EFwY1b61jXbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702169; x=1796306969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7838JVCVIFZHpChcKzHUN7ifBcuei9XazkkD9p8QNFU=;
        b=zT7VSxlfw8Zy5RNQlsJK1LwKAPuyjnb66/K7MuiJxWtbAPVWfWzXQlBvug83/N7n9w
         1uVOVTHvoD+UyLOP9b7Se3MNidjq2I80KVQSOOax5p4QQOUzvvNdXuwSY4IHoWpl73V3
         NSi0E814Ko9KcXxK6detMChVD9irRtKQWX7UxAQl73kC2pmtfOs98hdzU4VgHe8YqzM/
         OzG8DzRZG/gZlA+BxbtNxjIBlLAxa2Na2oMeSl1KnO53r/OpSeL0NdIPV3IHKEKH6dSV
         2NULSUEEIiH49gKRY2fuWFonqk7LemSpzdOfA/TW9VYs3P1+s1VuRbwJYMqsazf1yI4l
         tW9A==
X-Forwarded-Encrypted: i=1; AL+hErF3QyKiDj0P86XYg6jZoh1hSnJTr22iW2Ekfq9tcLBZ2pK+bPqroNuw2yJVb0ADPA6pgkmk3C8flVUasUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EF2dvViv6nrWVoYwBYCI4j7NZGfa39QdKDJdj9tvDlnZgzu9L
	fGqeHjrFy98Z/dtsrNRCpRxGjZNqUVPNFKD9V0gw+YpD1Y4PEbaFyVgi4oyiIx/0R5+4Gajq4px
	mKXF7Z2RO
X-Gm-Gg: AZFdTZdtLUJMO+0b9GbPhhtthr/U1YGV3srsh0je1xg14AgfEWr2CDcj9U2jztaTtAo
	qY3LT+xa3E3sk7H/L7fKvHDeMRDUCMKVuWyTK7oqxoz2g9JQMF+xAeu3FbaXRGvig1FtZXJkupy
	XsGnDehRNXBbY4O0Uyf0ily4goR3jHrbznAFysADbkzhw98zn7lj53C8x3CCbXRBwG41xtETny3
	+5KTTzZSNdPsfDon6u057rxPH6YjW+0E4D4qrSdPdexmT0MdkXn/9cVZr09Rhw/qWdPAvJSc0Rc
	tdszwmgAM++EBVtJz0pxD71QlsNVmjZc25u87fg/FP2mWSJ9NCLPhKIJV15iFetiOGINwVew7oA
	kaWdVB2smL1tQJX0U68a70Blqi77I+QHUMr5YmpWCFFzOsun0L1+VSkKr58vEk8eoo9Ld9pfNBD
	Ev1F1vgzyqM6peV7Fy5Onw9XzWDf8iE4QHAduwY7C51eo9bq43koEI+yPvLTFSM/mQ1foMSN4bS
	W+/2Agw2SYL/Y00Y0H71lTBX8gYGrZWggDw+GdlWVewjn4H7bAdfKkGSdcXsmCPmfC56jXRTrLv
	nWnO8uoheiBh1kcI+QAWltmdVvcRiKmPeY9bwTSAOV6OWIW+ZKQMAlPxoQzcwSc9wQ==
X-Received: by 2002:a05:6a00:4217:b0:89e:ad95:e01 with SMTP id d2e1a72fcca58-8c87d1254f0mr18934916b3a.46.1795702168957;
        Thu, 26 Nov 2026 06:09:28 -0800 (PST)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm10976984b3a.9.2026.11.26.06.09.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:09:28 -0800 (PST)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so9879729c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6QuNxo4LsiRWTDr4xqPbZpPTTGLd6rry0B537dEa0ICV3OQd3rLWrUGEyjQt093V1dPjQPqayjA3Coko=@vger.kernel.org
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id
 a92af1059eb24-1b5568e825emr23220173c88.21.1795702166818; Thu, 26 Nov 2026
 06:09:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org>
 <CANiDSCs1qyOpv=W-F-94skQm4o-Aj9d0PbL7xr5qtdtLjWQ7vg@mail.gmail.com> <0fd097a2-029b-4023-bc22-d2eb587a646d@app.fastmail.com>
In-Reply-To: <0fd097a2-029b-4023-bc22-d2eb587a646d@app.fastmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Nov 2026 15:09:10 +0100
X-Gmail-Original-Message-ID: <CANiDSCtcOa1UuCOb8wwpMdGRk_3Kb0aZtoiNfMXX2Y-0fCjorg@mail.gmail.com>
X-Gm-Features: Aa3M54rtRoX6wSK5Y9qAl8rp--BKPEAndffZ9pTASgsLVd44EKFxzDfIZ7n7-aM
Message-ID: <CANiDSCtcOa1UuCOb8wwpMdGRk_3Kb0aZtoiNfMXX2Y-0fCjorg@mail.gmail.com>
Subject: Re: [PATCH] HID: Merge duplicated documentation for Lenovo Legion
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

Thanks for your review. Do you know if this is going to land in the tree?

Thanks!

On Mon, 2 Nov 2026 at 18:48, Mark Pearson <mpearson-lenovo@squebb.ca> wrote=
:
>
> On Mon, Nov 2, 2026, at 7:40 AM, Ricardo Ribalda wrote:
> > Friendly ping...
> >
> > On Mon, 31 Aug 2026 at 13:12, Ricardo Ribalda <ribalda@chromium.org> wr=
ote:
> >>
> >> Lenovo Legion Go and Lenovo Legion Go S share some definitions. Merge =
them in
> >> sysfs-driver-hid-lenovo-go to avoid this warning:
> >>
> >> WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfac=
e num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times:=
 ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; ./Documentatio=
n/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
> >> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfa=
ce num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2=
 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Docum=
entation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
> >> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfa=
ce num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is define=
d 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Do=
cumentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
> >> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interfa=
ce num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is =
defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645=
; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go driv=
ers")
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  .../ABI/testing/sysfs-driver-hid-lenovo-go         | 11 +++----
> >>  .../ABI/testing/sysfs-driver-hid-lenovo-go-s       | 35 -------------=
---------
> >>  2 files changed, 6 insertions(+), 40 deletions(-)
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Do=
cumentation/ABI/testing/sysfs-driver-hid-lenovo-go
> >> index c8221373ef76..f3ba3504939d 100644
> >> --- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
> >> +++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
> >> @@ -364,11 +364,12 @@ Description:      This displays the available op=
tions for the mode attribute.
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
> >>  Date:          April 2026
> >>  Contact:       linux-input@vger.kernel.org
> >> -Description:   This controls the behavior of built in chord combinati=
ons.
> >> +Description:   This controls the behavior of built-in chord combinati=
ons.
>
> Nit - this minor change is not part of the patch description.
>
> >> +               For the Legion Go S, this controls the touchpad's oper=
ating mode.
> >>
> >>                 Values are windows or linux.
> >>
> >> -               Applies to Lenovo Legion Go and Go 2 line of handheld =
devices.
> >> +               Applies to Lenovo Legion Go, Go 2, and Go S line of ha=
ndheld devices.
> >>
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
> >>  Date:          April 2026
> >> @@ -377,7 +378,7 @@ Description:        This displays the available op=
tions for the os_mode attribute.
> >>
> >>                 Values are windows or linux.
> >>
> >> -               Applies to Lenovo Legion Go and Go 2 line of handheld =
devices.
> >> +               Applies to Lenovo Legion Go, Go 2, and Go S line of ha=
ndheld devices.
> >>
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
> >>  Date:          April 2026
> >> @@ -640,7 +641,7 @@ Description:        This controls enabling or disa=
bling the touchpad.
> >>
> >>                 Values are true, false.
> >>
> >> -               Applies to Lenovo Legion Go and Go 2 line of handheld =
devices.
> >> +               Applies to Lenovo Legion Go, Go 2, and Go S line of ha=
ndheld devices.
> >>
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_ind=
ex
> >>  Date:          April 2026
> >> @@ -649,7 +650,7 @@ Description:        This displays the available op=
tions for the touchpad/enabled attrib
> >>
> >>                 Values are true, false.
> >>
> >> -               Applies to Lenovo Legion Go and Go 2 line of handheld =
devices.
> >> +               Applies to Lenovo Legion Go, Go 2, and Go S line of ha=
ndheld devices.
> >>
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_e=
nabled
> >>  Date:          April 2026
> >> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/=
Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> >> index 4d317074bb7e..218164cfe544 100644
> >> --- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> >> +++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> >> @@ -231,41 +231,6 @@ Description:       This displays the available op=
tions for the mouse/step attribute.
> >>
> >>                 Applies to Lenovo Legion Go S line of handheld devices=
.
> >>
> >> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
> >> -Date:          April 2026
> >> -Contact:       linux-input@vger.kernel.org
> >> -Description:   This controls which value is used for the touchpads op=
erating mode.
> >> -
> >> -               Values are windows or linux.
> >> -
> >> -               Applies to Lenovo Legion Go S line of handheld devices=
.
> >> -
> >> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
> >> -Date:          April 2026
> >> -Contact:       linux-input@vger.kernel.org
> >> -Description:   This displays the available options for the os_mode at=
tribute.
> >> -
> >> -               Values are windows or linux.
> >> -
> >> -               Applies to Lenovo Legion Go S line of handheld devices=
.
> >> -
> >> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
> >> -Date:          April 2026
> >> -Contact:       linux-input@vger.kernel.org
> >> -Description:   This controls enabling or disabling the built-in touch=
pad.
> >> -
> >> -               Values are true or false.
> >> -
> >> -               Applies to Lenovo Legion Go S line of handheld devices=
.
> >> -
> >> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_ind=
ex
> >> -Date:          April 2026
> >> -Contact:       linux-input@vger.kernel.org
> >> -Description:   This displays the available options for the touchpad/e=
nabled attribute.
> >> -
> >> -               Values are true or false.
> >> -
> >> -               Applies to Lenovo Legion Go S line of handheld devices=
.
> >>
> >>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<i=
nterface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
> >>  Date:          April 2026
> >>
> >> ---
> >> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> >> change-id: 20260831-lenovo-go-7b4ec4bf0cd5
> >>
> >> Best regards,
> >> --
> >> Ricardo Ribalda <ribalda@chromium.org>
> >>
> >
> >
> > --
> > Ricardo Ribalda
>
> All looks good to me.
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Mark



--=20
Ricardo Ribalda
