Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570432;
	b=31YtcKiBVSkWOn1iwpKB964AYfPh7PFYE7cyoINzCVarRandJlw7/hrw+BlLkl5jgPVS
	 hHsVnfWhoh7wXfLWaQvQOI96VVVjHaVgaxp8vOhZ+/UmLMiTXWM2mG6F/MhHJ3P0LG7Dt
	 YSzjj74mlLhRxis4CJzIa5EC42gVWrTxIOrIBM5D7PxF8I6FVGd+857/SGSKDnX7rx0QB
	 Drv4eUN660hKDssNycEoLzMHOQvC7FFt40B+hiQ6+69tqP37bra8DlPTodR3DhaU7Fhnr
	 gh1a/3hkhzlKGDviilWd3N73QSsVtAOtsj8rQqrmJW6QwnyyeFS27vJSrtUhi4x8vzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
	b=dBzAkeSfCEyunjrYGAKmaXjhO2uPRFA8SowCJGMWhoV+6vRHk8u3Sq3frc/LDlFsdQp9
	 qAZNl1fKa0fg0Cuot5LJAhh7BGj0KwwoBLPK3RphUwXlICqn7OAsE46EO8lAQs3J8fNyQ
	 ZQlq/HRI6eJIzHzLxYhtxWdL8E4lOthPxdomnYDyp8Fy475xplNwb8k3butY+CDpCPVoG
	 pnnm0YUH9Fx5s+/RhrwxF3Rne7PkZiBWOIikkCfCpGbG8Mb5taB3UGYO3oEvH552IzSIb
	 9S1WtL7KE1uFbVS+pphsbF3HjjHaxnAraIwtDfWyBr9D9tbaYluPXNxENVpoPTb/c/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yk0LCVlg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17571606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17571606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yk0LCVlg
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-571c36e48d4so1194945b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795570431; cv=none;
        d=google.com; s=arc-20260327;
        b=GbchztzVtP8bL1ZWxmF6r4/vxQdQJJ2h4g/AHOFWQJCTJJvID7c+kTnkiiUfzllZ4l
         LslfnyEmXHHtwm8hmpT56g7OrtPPkBSfXDxpGyXYcv0QJvMt3VmC6OoSWx2zs+y+NEvO
         yxkIg+FN773ibYA77IgynI6F1CtahOe2jy14vyx0ktQIctwbL7/CKd7vX3l9q1ekvzCI
         wno4u3zAASxDPfk3gFL6aHSaXKi6ZEVknic8AXu5hriX9AYmJU3FM8+jeZyF2QZt0sc/
         1f8wmJ4DYG0rdbOvNv/S7CJ+IIltuUVodTODjmhQJMoATfGHAY1jmFgPumDYmAgVGKEJ
         ZAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        fh=XIUPnl3fQhr0MMuKfh6W78P8tq57QngyZ2AemocZzdY=;
        b=sZzjuhVu3ZsVZnJZ380UvijO2uyeJmmBumA9UohS1RfGJKEEHHMZtl4+spCWTz60OG
         9ins8hXMcFMgMKqydCUJTgwAeXdNKEqOLCzOHhHYasBlXX+0vp51Wz7gjpxtqNRsPbev
         R5ao/b6qFrwyd5twgKo8eeNdpDEXnlE4m/4tZjAPqCyMPHpN+ywu4OFyPdmGy5Z7cSxH
         +EdZ/qrs3lU0DqHjIabu3yTDi6d54y2mZrwvH7nPXrNIdI19vYeFx2J5xBP6opalVLDC
         o0YDL41drEDmFsgsXl0byE5e/JmxhbIXmRptljZ+0W+5yqkpbU+g6BuW6Jw75/io4Lxo
         pJMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570431; x=1796175231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        b=yk0LCVlgOmnU4D9i3CfR+hOfBJAC/XLTsmFpbB0pkEVbJRS4GQUEPPFBo5DSZ29Al7
         KM9EXI/MHZs3APRb+c3Kp8jRcj6BpExFU7rSZJX9NmHKt79Dsgw8cUtlidO8Rk9a+y3n
         ebogyhIuhfqqHKHyWrrc0Mb37tYDKOX+XxjN0dFTvbo9aTzTur548g5B7cqeeRQZsEOW
         yRuP6DWd/jRtrGEAK1gGp4Y+sD4UqU1JXdfoUY9Ok4p+YiiG5pxjkohoMeKo7SycoVUV
         BXqFLXlLBlMAZrlY3DIuG2ohnGkV0bo3SKxTCmGhchb4RvMVvNkC8asw7YyAC6A9I6jV
         M+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570431; x=1796175231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gip1NK0wBgJYUEfPwhQ0iwa8xhKGiGvuEG2VPSq03s=;
        b=gofR15ssBLwfB8zx3JxcFdlei4AmNNWH32xGWyOALpoqqPndP29wcuit6IDOCLhaog
         k8osnE2hwn3JsCv2boWqQeryMvmZy0rqgXcCkfYNwu3OmyQT20URl1u9W97fMnwY0YLI
         psWzvPoiqLm/8V+BCoh8NDeadxgzxxNEf0EENteOEC2ydB1s1H3Ta+WlnWz53cCnjFJ0
         4FRu26C5Vbqdu/Gk3T6BracvQbAaND7zPeeGGZa462tqNM6TE+KQ+0cBIDSYMKcs46V1
         pseXsEt57ktaZShqARIe7yfHwj2XaqPGTAfTnrgTEgsFohT7t6pqm9GihE+jWkHBilNI
         L3Uw==
X-Forwarded-Encrypted: i=1; AL+hErGi6VigLdgqoSO/qKZ9YaoqA+mF/gbJ/qjZitIRqVZ5gWeJk0Lrwqhv4+rtofiJ2IU+dncgmLyEhAyO9LU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88+6XrLBuEb4IU5Sij/+owoNq4ozXJYiCQMocFkBWT8mnM4n7+
	atvlgEq4vESiTmGb3EDTWYx4FJk9IuhZHO8OYYbsCGC0NBdc3ECLPjuZclv3cUxtwIdrTKMSaMW
	wuSdg7CzqsOU1EwU1Kr7Y62Autr+E2N4=
X-Gm-Gg: AZFdTZfJgRLK7QAg6dYWvo/KBkcgW1PoysKvTBGRsdD5hK/z/Wkm7yOU59XtI+AKvOP
	+c/LbhCJqzmDDevsy7yrp5MYnPskJX8wHUvX2Y2Yknj5qHpD7yCfGAxkwEtl/KZIrM09+q5CvfT
	loJnTWZQiAXGMddO3BUqowq0ej3ekWhCTmrq77Hoh5qHp2y6KLCywTQRXImx3rWTg/qMeRM/QJn
	PWZcylCTnL3fnBDwt3zqJmHfK3bgOMW4LTnfacByY/dwXZ0bjJ7ctiR7V7IGaWZdL4lEI8ch6Zz
	kO0d1HFpQTYptX3N5UdsEdgN6exgveTkssVURbsjY4Ccrl7t9L/3zQAmIXzRL5ZnoBJzilPcfqK
	2nuw8JPcTbq6VrnJ4HScpCzUwJXCu4AQvjcOF9KBX
X-Received: by 2002:a05:6808:23ca:b0:571:ceaa:3e29 with SMTP id
 5614622812f47-57a035c721emr20126919b6e.0.1795570430804; Tue, 24 Nov 2026
 17:33:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123072320.5967-1-ki.chiang65@gmail.com> <20261123122343.6d3f8866.michal.pecio@gmail.com>
In-Reply-To: <20261123122343.6d3f8866.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Wed, 25 Nov 2026 09:33:38 +0800
X-Gm-Features: Aa3M54o4sBnpfJ7sTPNKoH-u4KSZQxGsSF95VQe859Y3yKpAPoeTSt-tRM9-78g
Message-ID: <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for testing and sharing the detailed logs.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=8823=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:23=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> This repro doesn't seem to work for me.
> [...]

I tested again on an EJ188 with three USB2 hubs connected, without the
proposed fix but with extra local debug messages to detect ports that
are in the resume state without a Port Status Change Event.

When I connected the first mouse to hub 3, I saw the same behavior as
in your test: the USB core checked all root hub ports, and all three
hubs completed resume (evt 000e).

However, when I connected a second mouse to hub 2, the root hub was
already active. Port 1 also entered the resume state without an event,
but only port 2 was reported in the status bitmap (evt 0004).

Both mice worked, but a third mouse connected to hub 1 had no effect.

So the issue seems to occur when another suspended port enters the
resume state while the root hub is already active.

Here are the test logs:

02:00.0 USB controller: Etron Technology, Inc. EJ188/EJ198 USB 3.0
Host Controller
/:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    |__ Port 001: Dev 004, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
    |__ Port 002: Dev 005, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
    |__ Port 003: Dev 006, If 0, Class=3DHub, Driver=3Dhub/4p, 480M

# connecting a mouse to hub 3 resumes the bus:
[ 3613.057015] xhci_hcd 0000:02:00.0: Port change event, 5-3, id 3,
portsc: 0xc400fe3
[ 3613.057091] xhci_hcd 0000:02:00.0: resume root hub
[ 3613.057106] xhci_hcd 0000:02:00.0: port resume event for port 3
[ 3613.057114] xhci_hcd 0000:02:00.0: resume HS port 3
[ 3613.057122] xhci_hcd 0000:02:00.0: USB2 port 1 resumed without
event, portsc: 0xc000fe3
[ 3613.057129] xhci_hcd 0000:02:00.0: USB2 port 2 resumed without
event, portsc: 0xc000fe3
[ 3613.057170] usb usb5: usb wakeup-resume
[ 3613.057184] usb usb5: usb auto-resume
[ 3613.057206] hub 5-0:1.0: hub_resume

# core checks all RH ports; ports 1, 2 and 3 are resuming:
[ 3613.057221] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xfe3,
return 0x507
[ 3613.057269] usb usb5-port1: status 0507 change 0000
[ 3613.057284] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xfe3,
return 0x507
[ 3613.057317] usb usb5-port2: status 0507 change 0000
[ 3613.057331] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xfe3,
return 0x507
[ 3613.057361] usb usb5-port3: status 0507 change 0000
[ 3613.057376] xhci_hcd 0000:02:00.0: Get port status 5-4 read: 0x2a0,
return 0x100
[ 3613.057416] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.057728] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.295602] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 000e

# hub 1 is resumed, inspected and suspended again
[ 3613.295628] xhci_hcd 0000:02:00.0: resume USB2 port 5-1
[ 3613.295639] xhci_hcd 0000:02:00.0: Set port 5-1 link state, portsc:
0xfe3, write 0x10e01
[ 3613.295743] xhci_hcd 0000:02:00.0: Port change event, 5-1, id 1,
portsc: 0x400e03
[ 3613.295774] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xfe3,
return 0x40503
[ 3613.295819] xhci_hcd 0000:02:00.0: clear port1 suspend/resume
change, portsc: 0xe03
[ 3613.306530] usb 5-1: usb wakeup-resume
[ 3613.306558] xhci_hcd 0000:02:00.0: Get port status 5-1 read: 0xe03,
return 0x503
[ 3613.317615] usb 5-1: Waited 0ms for CONNECT
[ 3613.317626] usb 5-1: finish resume
[ 3613.318018] hub 5-1:1.0: hub_resume
[ 3613.320288] usb usb5-port1: resume, status 0
[ 3613.320306] xhci_hcd 0000:02:00.0: resume USB2 port 5-2
[ 3613.320316] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xfe3, write 0x10e01
[ 3613.320340] hub 5-1:1.0: state 7 ports 7 chg 0000 evt 0000
[ 3613.320381] hub 5-1:1.0: hub_suspend
[ 3613.321518] xhci_hcd 0000:02:00.0: Set port 5-1 link state, portsc:
0xe03, write 0x10e61

# hub 2 is resumed, inspected and suspended again
[ 3613.331561] usb 5-2: usb wakeup-resume
[ 3613.331592] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xe03,
return 0x503
[ 3613.332562] usb 5-1: usb auto-suspend, wakeup 1
[ 3613.342518] usb 5-2: Waited 0ms for CONNECT
[ 3613.342532] usb 5-2: finish resume
[ 3613.343274] hub 5-2:1.0: hub_resume
[ 3613.345374] usb usb5-port2: resume, status 0
[ 3613.345393] xhci_hcd 0000:02:00.0: resume USB2 port 5-3
[ 3613.345403] xhci_hcd 0000:02:00.0: Set port 5-3 link state, portsc:
0xfe3, write 0x10e01
[ 3613.345427] hub 5-2:1.0: state 7 ports 4 chg 0000 evt 0000
[ 3613.345439] xhci_hcd 0000:02:00.0: Port change event, 5-3, id 3,
portsc: 0x400e03
[ 3613.345497] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xfe3,
return 0x40503
[ 3613.345548] xhci_hcd 0000:02:00.0: clear port3 suspend/resume
change, portsc: 0xe03
[ 3613.347649] hub 5-2:1.0: hub_suspend
[ 3613.348842] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xe03, write 0x10e61

# hub 3 is resumed, inspected and the device enabled
[ 3613.356604] usb 5-3: usb wakeup-resume
[ 3613.356628] xhci_hcd 0000:02:00.0: Get port status 5-3 read: 0xe03,
return 0x503
[ 3613.359576] usb 5-2: usb auto-suspend, wakeup 1
[ 3613.368504] usb 5-3: Waited 0ms for CONNECT
[ 3613.368515] usb 5-3: finish resume
[ 3613.368981] hub 5-3:1.0: hub_resume
[ 3613.370094] usb 5-3-port4: status 0101 change 0001
[ 3613.471650] usb usb5-port3: resume, status 0
[ 3613.471671] hub 5-3:1.0: state 7 ports 4 chg 0010 evt 0000
[ 3613.472020] usb 5-3-port4: status 0101, change 0000, 12 Mb/s
[ 3613.543564] xhci_hcd 0000:02:00.0: xhci_hub_status_data: stopping
usb5 port polling
[ 3613.544505] usb 5-3.4: new full-speed USB device number 7 using xhci_hcd

# connecting a second mouse to hub 2 resumes port 2:
[ 3622.523436] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2,
portsc: 0x400fe3
[ 3622.523492] xhci_hcd 0000:02:00.0: port resume event for port 2
[ 3622.523499] xhci_hcd 0000:02:00.0: resume HS port 2
[ 3622.523507] xhci_hcd 0000:02:00.0: USB2 port 1 resumed without
event, portsc: 0xfe3
[ 3622.564503] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 3622.564530] xhci_hcd 0000:02:00.0: resume USB2 port 5-2
[ 3622.564541] xhci_hcd 0000:02:00.0: Set port 5-2 link state, portsc:
0xfe3, write 0x10e01
[ 3622.564651] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2,
portsc: 0x400e03
[ 3622.564684] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xfe3,
return 0x40503
[ 3622.564744] xhci_hcd 0000:02:00.0: clear port2 suspend/resume
change, portsc: 0xe03

# hub 2 is resumed, inspected and the device enabled
[ 3622.575423] usb 5-2: usb wakeup-resume
[ 3622.575451] xhci_hcd 0000:02:00.0: Get port status 5-2 read: 0xe03,
return 0x503
[ 3622.586477] usb 5-2: Waited 0ms for CONNECT
[ 3622.586487] usb 5-2: finish resume
[ 3622.587310] hub 5-2:1.0: hub_resume
[ 3622.588566] usb 5-2-port2: status 0301 change 0001
[ 3622.695551] usb usb5-port2: resume, status 0
[ 3622.695573] hub 5-2:1.0: state 7 ports 4 chg 0004 evt 0000
[ 3622.696175] usb 5-2-port2: status 0301, change 0000, 1.5 Mb/s
[ 3622.696661] usb 5-2-port2: indicator auto status 0
[ 3622.773415] usb 5-2.2: new low-speed USB device number 8 using xhci_hcd

# connecting a third mouse to hub 1 has no effect

Regards,
Kuangyi
