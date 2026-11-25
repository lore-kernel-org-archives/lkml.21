Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614918;
	b=qz0Qwgtkb+qhu7aI9Cpdp75NfZS6pXopHToqpIBMw3NW3PorTduq0zrsJMKaD+hawJjv
	 yb9pIYPoLxGXwyqwjjFl+ia2Wylq3TzyU3EnxRHQaylI6QcZP8O/qzb6BzyCAgCMTgmsW
	 ebW1RxDNNtZUYESEfGrR3keEoXO77ZpyZJ0ctLWeZr+1FOwqeZBqtNxTvrSb2XGgcj0ke
	 Kv8nLyADkox1PWIF2cMIOz+B2c3i/SYvIR/G9Bi2HZYajLXGOzcCASeTFc7z2G0BorgJe
	 6NH+DHvC5juQwQ5d2Jccm1gLv3rticiv1yzluwKiF0vdDaM1cm8L6ai5LmDP5DdR6lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
	b=lsnYvdgqIPVjrJyhAkMGGsFcxX/gYWZ7w17cXCsr2i5nlwVMOl0mBWfFJFh832ap9T6E
	 D2+TBIeroypdmHbqaBAJTuV0/df+sWtlf4KgvfaX0l0WbYm0Ik3rRqNhVzm5ZgDOZNbpp
	 1XTxnBJ94vHdzHilt7JufqVS8yN8aZnuFcmdIThzOnPVFlcB/uqjdMyMdS8DkXOIYiPQH
	 FyBKUmsMgMv3g3pqdKcCKin1VocPxXLrxvB3tWhscizOj4wv9GGJadM3yfQe1QexYVPxc
	 XZl3NtajQd5McWQx/vlfiI094vjgX0qlm6Kx3QmmEy4mQ6Fg6FJ5rAXVMyI9OBmceag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="s6M/SDal";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8839606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8839606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=s6M/SDal
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1110302566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614916; cv=none;
        d=google.com; s=arc-20260327;
        b=HIGa4G7K2gq9/MNWEMrP6HD+++bCxvRwTX7WcL/Lgc9Yq/gOvvMIo0DskCqizLVXsl
         0wOF6RiR7FIyliiNBCsfE9RN2Xl+AQqLVv1c9/HB4jXqz2fkNq313jVmjNktz1/5MIHy
         T6eCUVwrU2hAjsVIq8iossegPHONYlaOgJNo5ALV4FRk7jTjOJ27adKFyz2TP/o37oiz
         c4ZMhex/vtchrsVJmwaP5bp/8yINr3k8wTnMHEdHZ7CI4e2gJ2uIJQbDul2BNW3xCy1c
         lYTz4xwTvTA8j24RxEx3JMbH1HW16ZM48RlSlFwLIN6TEI1hKt/Yywc7KagrrSWa6HSP
         sFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        fh=UWLN9/caWI1vrPqivq+ujJHCxzGfZ0ajRD0E2TzJ3GI=;
        b=lp26Wrnf83obMPTA9uXpePatmT7bgUgvsoGY9j384QnLx3D7769TAfzWX+v0yHd4cN
         wodKzdUwhdMQZXT5/Mi3OeE4EPpW1D+fLKYMjUGA4wJjmX/iqtCGR8+VHl/RSitOWEjF
         eqPsf/1gegcnayepD5d8mkKUe+Y4ZRX+/IvAEi0Zi8H8gEDZrANPup1Nqqj8/KoiyN8N
         nK+e9Uio+CmaI2D/cjneOvszCdomxKVR5twwFHJvl8BTqCxN1nX8YvMNbxwfBzkgn0zM
         as9+5B1Y7lOZC3p8gj23gIUQneJJqcVkFTospib5bfXTuf+AEx/DQQxyFkcfPVX+aJLH
         2MbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795614916; x=1796219716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=s6M/SDalISUI+jHyF1ygvsSJMXSzjcqCmvFuiNVEBqojZZqJk0awSxIA+xKTcFGZAg
         5PuEJlfkmW1iIPTOzc8HZx5zIx/PbL4NiHhDaxPQgE02vkGvH9r/JpOB7eMQDd8xb+Yy
         jKfzzwex9hReuI3uPx7ExJ7Akd3T9UGzK2V6LwBQwvQaC7Ybz8HjdVvTojvo096o5x6u
         I9kLHc8YxNpkEIXaNvShw7u90i/sMbVsdkfOXOeF3HfUe8Gp4ZcCJCmmzGvtqunMqrQs
         AWomcXaWWanscLtu8670AAkTPyfDJXcTOmKPn8shjYR28fEG29qlUU22w4QDNcHb3vRc
         Ddgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614916; x=1796219716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=L7T+EDawk2uM6I+tXimqKgQWJOGs++LNVsGnJEKsCzHw/qkHdQIKkTmU0iuFUYKiNv
         6geK1gLXoM/xlGYnuiwcNViqkupBL/7tudIjnOFiSlbPTnBaPO8+Db/pGQ8XQHCDYBn3
         Ga6vrjSMBSu3fJ7CWWBHW5ebONgmpSt47IQvcCKA2R7r/fJIauY9FyxYtc0zzF/CvyjU
         S1YJccIXJqIkWKiX9YTU7eZAbopLjPDDg7+8rPhIdNZH1n8tsABzGKcLJq+xq0WibgBJ
         J6RIN1RI/8fEu/yK/w/QXt0K9+NIwHBTjx4rAfhwB3fZsxvdqt6YqtVHMKZjoADDX7ah
         W2NQ==
X-Forwarded-Encrypted: i=1; AL+hErF42zFH8SnJKN8Rm+3umAG6Ly0boqPMV//vzWojJEJojFLzkEA7rseWiEd3CYjdu7twYn/z0EPORtk8lbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y2jxIOKkvDiEjozdMSwX3/HnyCyMTzRtear6dRKv/P8XqQd66
	xhNJs+slSwZJyYCU4U1kHBCiVpR8TbFO6zaBTrRT1kaSFdFpzXeID28xDdohsz5cjA68EiZQmlW
	UE6NBIb3PaFTWTVIdT1TcQzkDTCI8D7iD9t3nis3R/A==
X-Gm-Gg: AZFdTZfzZtn9rY6EaonB0/HxUsYf4NWSeTWhfWKIC7PZkoLiO4k9hel+w2K/Dw9i0jP
	iOyweZxz3y7eYZra9+lznCOwPrEM4cGFCsWrjdec3gjpmfl/oFH/HsanhFky99mucwbuWG9Nsdw
	qQ4awhagEa7bLvTuU7eHFaaFzTKjMOjXaXAa1IqAfThMDaE2+spky24d/fjE6MklR4gwQTmTp4W
	MpaoFMI/Bd+B2HYWCeM2y/6DAAf4G/1BSPnU54ne61bZDsmVdIZwri9BqDVjajM+adaq6QirLqL
	/BZYOqw0iBH+UG6L2/AKXHxe+zthfdV3gbrTG5e0/SbYtfSnKILA05beKo699R+41n1MqIAn1ju
	sk5fzaplME/qS0HMRG1YIe37ga6ZE6omuEAeVhZqL1fbkMhI5B3Z14g==
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id
 a640c23a62f3a-c5150c98208mr1275142566b.10.1795614916108; Wed, 25 Nov 2026
 05:55:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net> <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 17:55:04 +0400
X-Gm-Features: Aa3M54pv9ze0w4z1urAY277TKJgQi-9HwT3ngn04WBh3FoiAC5gcBe50J9g0GsQ
Message-ID: <CAKTNdwFwuG9bWStnuttiXY0o_iqMX3Eu_0DhFtxXt09Bp3Dz4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Wed, Nov 25, 2026 at 5:49=E2=80=AFPM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipp=
er.net> wrote:
>
> > Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> > ID in the OTP memory and patch them into the device tree they pass on.
> > Kernels started any other way, e.g. straight from the SPL in Falcon
> > mode, end up with random addresses which change on every boot, even
> > though the CPU ID is just as readable from Linux.
> >
> > Implement the derivation for cells marked as "rockchip,cpuid", handing
> > the result to consumers which ask for the cell as "mac-address", such a=
s
> > of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> > so that the same cell keeps serving the ID itself.
[...]
>
> Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

I deliberately avoided that because, at the hardware level, the OTP
cell contains a CPUID, not an address. The special treatment applies
only when the CPUID is used for MAC address derivation - which IMO is
better captured in the binding description. Let's see what the
maintainers have to say though.

> Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S
>
> I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the M=
AC address was exactly as expected.

Thanks a lot for testing!

Best regards,
Alexey
