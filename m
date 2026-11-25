Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795650252;
	b=JGc8AzLmAsalMla95y4bArIcbmQ8l7Js2EkiOhnMXnbVv1jU3m4YHkFZy6F5T4aYvXxc
	 AFLOnCBNevNiFvIoNofBQ1hXxCq8GksL0j4Y+/3kPlgcbofhVGyLiPTii0cmuUo41CPL6
	 CycYjlkNALEb7+pT7hUPnWAOiROaihnQyWiMdKh67idP1hSrx1X/DaFhW1GDb1exdMukT
	 E5P02j+K8ycnRH77CBxfzTNCpervCsE8InFTLj39qxtdZOqsXOidHcRqhpqq4XQNzb8Nl
	 JSbsItgaGJHcutugkrzF/4z4rNOrOTBr125PScTJe6grdWtXAG9BKrVGKriHyUQLLOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3fKVuvxJiitltgDu0Bbbp5nZdcLodGhOo/Sf+vkWL2A=;
	b=mprrxNTX8XTxOIEP3rLCmfq60vzjL/Ba/cbtOvZ4Xv/DO3Rc+IAmaOg8Qb58yuJPZSOy
	 Zqu0mpQVKWUIFRi88bsfjIuPatHaTLqSfbtrYZR/xZ1WeUaUJiChWOulPeOCDCMPtOpPf
	 9gIhNObv8m7/VFh5iNCQ3trdN/+dHd5FYtcqVUuDh0NahtxTE1q/Yyt+ffbhc5ziZQXcv
	 Y0nUMwm3BUHCgQrqbJUEGPt+hnsWPJDZgfE74ZtrC66qhHJw8jNC+TCvMpaY9o/KYMx3D
	 8afT6uSpdRnh5T47vKpwxnrTUxgAfX6F9R1xAG5A2cYW48SrebBS9/HLVAhlHVdBdJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmJuD6RO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC65606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmJuD6RO
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921276742e3so58953256d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795650251; cv=none;
        d=google.com; s=arc-20260327;
        b=Fw0SBQ3/+1mumaD3XP9v1O+5NNJvY/jZRS7PUhKpZ4SHszvTMjzTcX/XkIc3wQUfku
         itSJwLCsVnEP7IJU7KN08ftxDPZQcoGWbVtT+qAEYy1l9x5ZkdabRIUuxa3366uObFK2
         GQlKcgaT3Xsd8OQ+emEH2MtVQ9kMo4ywdeHoLtiiDTWH8tGEE4qsu0RvIZfRHhNOmvcJ
         U6s4r2kmASBNuO5jAT0349FjWRCnyzfQ7EZCJ+LdWvBNvHE+3OH8SbjUSyp/bXzl81cL
         OsImpJ3YOdHY4HLG+YWGPT0sga4m6uHA6YSUk2Pm1uOymc70icGTgJvELy4mFQZspDq+
         lsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fKVuvxJiitltgDu0Bbbp5nZdcLodGhOo/Sf+vkWL2A=;
        fh=sXYfnnNag2BYUOBiqDhFgJiCt70QejIyWOm7gJ2X3RI=;
        b=N7Npwj63P+WSSe40AoZ4kCpVO01E+5E2XdcwkKxn2TLNkItA8I//FlND2/3UUqIZ/c
         63a02Nz7P68/fQV6NZc0H7ZYMr34qIiYZb3DPRh4XJU/yqc4sRghTxm1AhPIQx799T39
         MJ1uUokeX8swh7cEr7FpbDJesLKBLiL6EU9M84s7pKA9NBJcDawlP0mwnp8RkrtAbCmc
         7+exXr88I/8et4x9BqflJUbdJvLNLNyh8av89pfO41O7fa6C5ByjpRdnWNcdvv0+unLU
         zLYa/5/bhYcJNZ3NOqqdzscjWOnk/71Ynq32Bm2hNSQBiaOL0LOBOx9njiIxm0eAytKj
         t3XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650251; x=1796255051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fKVuvxJiitltgDu0Bbbp5nZdcLodGhOo/Sf+vkWL2A=;
        b=bmJuD6ROued+2PTNWeWOaIyCpqiQnHn3HWgucB/55qQF38Yijq3MpLKSKbxwUprY/2
         YpYe1CnFRMCA2a79ZnafGiv3RjAat38tRKLc6zQuOW6JMbPvi73VO207I69YWc+9paEV
         WdB3/pZcfAmsgBcqUGtD4245mB50hMJVj/IzYvUxDDmkLe8DDztPSFx11Uf1rqgLOY5M
         jBBlO3XnVhyIFbaYLH7iRGdLzSoywxx+agXjhcLL5cORna9uQ9INbA9ZCaheGJTVRcvb
         wqZ//Ta/IqLOaqIPCYPJ0S6mRo2YyntVWCxvXSkftKD/fHVkEk3iwzoNoLYN5mewiQPV
         HhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650251; x=1796255051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fKVuvxJiitltgDu0Bbbp5nZdcLodGhOo/Sf+vkWL2A=;
        b=IVG+UN2Ru5+phIkSQgWzh/pYDFikDCJ3GVMfxf2wIjx/iT6FNimSWUOfPJQFB8t17v
         QdJHo1oNLUCWC85/nCPtE/KM3uuKfdU9KohBKOlh5jelQM1OzilOaTcXN4b6pg10qnD8
         0xBunAloX6fF1PKN9E8HiXKlt/vd1GSK0quo1zc1+QT+Pt2UlGtju0RHHjwktfnfl/Yt
         kdZDEDA1XRvRHdltpT9Ijys1RoM1su0wcbCd7i7hbpIb7e4uMw+mwD5EYnpTV0lIKbPj
         TgYaGCHuGSnNkI+RQxftVcb8UjY58Tqybk0WrQNIhgY+WDq9gE/08Yik1YiYX4fRppL2
         0h6g==
X-Forwarded-Encrypted: i=1; AL+hErFLp9BFY76X+rvyPHCGE9XPmqn7+L8I0hOcWs6O38P0RMqUhRgR+HKD4AJ/jM8XLS3D8uEa4z6yuk51wHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cwh+8tidYBBr1PDdpo9Lnyzxc+Yevaj+AeusbEMcdiTkhQrfX
	uoazpZ2CJLo6e4UMTBla9/yubTmQX7L3gNUoOufkQbZV0Tec3swb4FtnWaIeTdC7iJRv/wjz+5w
	izYnBem0qC7oNlgjdYC6tD/pTj9Ug6sc=
X-Gm-Gg: AZFdTZdW3F0G81VSe6RVW6G/YpFiKmJ5RlJXP5rv2CwKiQIotVDoRwQ69zntqfmDazz
	htsGe4iBpuoXCqSJiOrSV0pup6EmO+9eez27Gf25x1zqeis0Pw6rYEHP4BVpUaRIzCu3HoJpAyr
	3zpbHJTES7m0cFJ0OYPKiYSkic8VoabxTxIj/2TTKMt5hXGLz/2wdzijBaIcqz8GsPJrz9kEeri
	gcKfAPMkxsQ7Y1ZpPiMpMH6BuB0aBNLhoD1Br7Qtxqe8QY2pmjl4OrtRpibQeL6mGHWVKhSjPZp
	menXaKlOQd3PGLOIuKGKm2QwvEfd/FB93GCylsVnSA6ETPAbr1AsDhUgPM3gc9N74jaPhV1ibUV
	1SUB3dIWj+YCXE1JlnVA8TSVEDDq9Qmpe2BSN
X-Received: by 2002:a05:6214:dc7:b0:921:38d7:3aee with SMTP id
 6a1803df08f44-92138d73c1cmr355955956d6.28.1795650251100; Wed, 25 Nov 2026
 15:44:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <PAXP251MB001050EFD88752318EBA75F5C8B42@PAXP251MB0010.EURP251.PROD.OUTLOOK.COM>
 <0291r4so-4p5q-61n5-59qq-761s5s45o2s9@xreary.bet>
In-Reply-To: <0291r4so-4p5q-61n5-59qq-761s5s45o2s9@xreary.bet>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 25 Nov 2026 15:43:59 -0800
X-Gm-Features: Aa3M54qop82j0BkkAyG8OqBuWQazFLUjeeuZGk8YRliw8mF8W_6Holy85ZPTGA8
Message-ID: <CANRwn3S0hViGQw_X2sw-MG5FtPXqwLWABOTaE5JNUgaDOw73jA@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Cancel init_work when probe fails after
 scheduling it
To: Jiri Kosina <jikos@kernel.org>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Myeonghun Pak <mhun512@gmail.com>, Sashiko AI <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:29=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Sat, 5 Sep 2026, Aamir Ahmed wrote:
>
> > wacom_parse_and_register() schedules wacom->init_work with a one second
> > delay from wacom_query_tablet_data(), and only then opens the hardware
> > for devices with WACOM_DEVICETYPE_WL_MONITOR, that is the wireless
> > receiver's monitor interface and the ExpressKey Remote. If that
> > hid_hw_open() fails, the error path stops the hardware and releases the
> > driver's resources but leaves init_work pending.
> >
> > wacom_probe() then returns the error and the HID core releases the
> > devres group it opened around probe(), which frees the wacom structure
> > allocated with devm_kzalloc(). When init_work runs a second later,
> > wacom_init_work() derives the wacom pointer from the work item, so
> > _wacom_query_tablet_data() and wacom_led_control() read and write freed
> > memory.
> >
> > This is the only work item that can be pending at that point. The
> > others are scheduled from incoming reports, and the HID core drops
> > reports for the whole of probe() by holding driver_input_lock, which
> > this driver never releases early. The neighbouring BAMBOO_TOUCH error
> > path already cancels init_work before failing for the same reason.
> >
> > Cancel init_work on the shared error path, after hid_hw_stop() as
> > wacom_remove() does. The cancel is harmless where the work was never
> > scheduled or was already cancelled.
> >
> > Fixes: a544c619a54b ("HID: wacom: do not attempt to switch mode while i=
n probe")
> > Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/linux-input/20260905102908.ADE1F1F00A3D=
@smtp.kernel.org/
> > Assisted-by: LLM
> > Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>
>
> Ping, Jason, your review of this one would be appreciated as well. Thanks=
,
>
> --
> Jiri Kosina
> SUSE Labs
>

Hey Jiri,

It looks like the line added by this patch has already been accepted
as part of another commit at the tip of for-7.4/wacom:

ba16e5ffbaa1 ("HID: wacom: Advertise SW_MUTE_DEVICE capability prior
to registration")

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
