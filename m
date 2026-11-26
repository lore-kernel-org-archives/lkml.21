Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795687738;
	b=3hsG4Vb8eHw/eUsz+SUiaUBfe6sOWEQWARNmLd9cDjx42uxUlZWRsTPPwKRX+FJg5PnJ
	 QJ9WxvGYFJSQZreHaZ7Yo6Pamp2aKOXPAlUFS3YTEd8KO3SsEF52rcZ4Xnh9eFWaVThwD
	 NNZpHHZKfTcyG4fjI5fTQAGzsH6Vd6Gh+2C2/22s2Qa4vVTvXQfrxW3bHW4PkSLrSUBCU
	 vXXeNIDxvxVjDm3hacsF06od5Wh4aW2QegbcoRRpXGzWhKjYZAavzxghBAUHlXfN/T85B
	 j4F6qFo9qul2jTZB0H+VwVXWBYonMOzyv6OlY3mmoVMMfBDsZVXrdIg1myOqJKU/HwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
	b=as2moYpDHV8t5E7IZsYlmKz7gnBQ2kzYPJTu4JxTDJW3N+ieLfp1dHoQFbmudQviQs/p
	 IHYRIBvF6aQrzgA8HrUkrAE+P7meFgrB04Yl1eHJbeQoV+9q5TorTByc/sts/zNlayeht
	 7KkALEu3peZftyDwTBHqoivdTgf3183NB+R5DumUrlnLled+DKfpo5QXtU7v8ergvDIeh
	 w6SoOxe4CAoNduhYTrz8efMjLqcsH4aU5LU8JSI8XYXLndvXuyA2F9TWjv/kjO7pov6J8
	 +one3x5iIJhnOWDWBdz7dOupiJs2cQpjMKJ/tLBZVN6XRKAojELVRAvzanPyDkIlAGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLnLq7sw;
	arc=fail smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84447606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84447606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLnLq7sw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso9775026a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795687737; cv=none;
        d=google.com; s=arc-20260327;
        b=TnYRQ6PXZdcjuMDRuD6ta2kK3EdRfTfpRC76Iz/X7p5IGZKGfmtVuLgu0HXy9dBEak
         BQ8rDKIOsdUe5G478LMyvFZCnITxKNnpM50FUV7a6BsCfAIQIMMey+TNCN2bImS0noXg
         yQTYTZWWwbJg9CaH2gP/Y/y+3yBblIZa9SrGozR+70C/3HUs622StNmnecHfFeDlFn6H
         eeW7uupcBhnhHrNs5kO8ZJKvQmQhzJD/mLTdcZu0xaUslA4tsWyxEPax7oYVuu34wtXL
         Oll8FxxyhQS7jIBP+2YdYaJzXtMcW7KE2G9STmGlgB3+nh6hwK/pTM3a5GZIa15n0g2H
         4XFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        fh=FIdMtxBcGi1trKgR7cwqxpM9eavhUx+2L8n4e/0pjHA=;
        b=W+ALjyOCJVLTKMcNn9EQOA8W8Z7pzIVxxDrhZZeycAiWmiP47YPNOlHSPcPUyxFoBs
         UbOnkw1c8kW6rHNFc7z/rl+Zb28VeCJyUPFsNLbeecq5OvwjVGQZnghXTGf71/G9h+4C
         f8r4AJnkWXryFCm0H3uhBqkwHHzg5Zggq62/A5/1WVVVJbhO6ghY0/7tDZlPV9+xKXuV
         eaJ+9siR4F5ZtTlkXio80UiN7C0R+LGDItKiEjq5xEmypNUBG4guFjIgV7K0IKkoJP1q
         s5Aev9Nuxmz8f0vVS0maarajfHcqlIvN2zno+n0TTMYPFw3RqO2f1Lw3RZCGDHIRuMYd
         P4pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687737; x=1796292537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        b=BLnLq7swDKkGqwuOkT88kDi/k5Wkx5oS93R+YopL4cpAdWoUggr1K/iXwHu9AMn7jW
         YdCVPUsJFlfBA/kA/tjTHmEFgNHxTvJsTOvLzcq2//cNf0QTiA/3BC9fiqw9OnGi+rXk
         ZwxF2DnIp0XOHmhNr1oRVzv8FMN2uwvjA7NNhW4osabSFGPHv46o/L57MH7b8bm2za+A
         m2XggcYchWL5IHY3hFg+HAUeKqQDThIEHXs2Z8C9i2O6sSJM0IZ38NEn6RLh9z8JEHZD
         VnL3TYvQFKyv3jpmH3mxanQdF/liqE7IP0ck90K68jb7cFne5MPTJyexbCgb/IUcT+A2
         X7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687737; x=1796292537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        b=vDhlynpYfRejBrBqBHQPwTRQVBerKxw8EW6L8ESG4hIw/l+i2QXSHOsx3PrzIBUTcL
         nCOGBObuR2DUAVn57lCT9gzyEPdL2tuHcQuoVtC8udhlswq/cSqH9rX3sEMC0twMK5yx
         MQN8qN/iyInPEUBLEu3E57gRMWxrK43/TtcHffA3ygCPIHv0fkpZTYQuKbphJVUh2k0Q
         wPI1G0VdVk3RgcwmDQqwU9kpDfzSeHPR66WTgI5xTkhmdeET6OedwGRhzXI/Yf3tEWUC
         5bW8Ats1kSoovGJ3Q66MYRG0krn4udEwUoOGNKSI+sZJL05Xi22IfRDILMyL72RRrH7B
         iWeA==
X-Forwarded-Encrypted: i=1; AL+hErFTvYog83Ifg7uV24euRSjerJvH5VzYcHQsvFqm91xsy0ZcwxN+QAMipIpzyXNmBWB/tMTjKeg00wdf9aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L7MCXd22rYm6wFOFH1ngqto4ZtVAe88AnKt3KsJXlSHOxDcgq
	n0I1xgkAC8nel9YBH4kXr7IDmXKQbmdwh+GLowX4Dtx/8bOEZc/m4C4U22NucpqpbclHyiZADYT
	VgeMOpblUpW469WRTnLOVjDZSuq7Ddzw=
X-Gm-Gg: AZFdTZefJJdrc76/WzQwvSv7mSnj5NGFOQbaOYV9XqsCBquKIianAUvPcvSwFWSkUVi
	+iGjDZu2FLeRSl5Vj7+PODYWS1yv3m/dA0GMB9PRsbE/LLyKtiFREdG7nsYaha4na9duEzlMXHh
	V3sDfagzV6Tg0HelTUmq9V66dSNbaIzNbjcP5j3VkhCVr97ygA47ZVjfDJH5nHbdpNklZVU7zs4
	RNogk/Rsg1O1iteu8o2U4HMttkDPzQ7962jBSNWx5ZIPNwST8BpywUGpF9wWYpNBajtzyGJ8xCz
	91cN3vjPbj0VmTA2UVr1FWNTtKAjtvuzq8bqzD+5h1FyoORClHohtfk2dV+830OkvvAxAn9F+N0
	1VH5v8p/mIJC0pMzPU5m2Rtx1juUv8e/BEXE5IMaUsAiZVy91WuvEBHWFbXd8ilDmbi4af9CLVA
	==
X-Received: by 2002:a17:907:2d91:b0:c51:982e:28bf with SMTP id
 a640c23a62f3a-c51982e29d1mr584103766b.40.1795687736599; Thu, 26 Nov 2026
 02:08:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Thu, 26 Nov 2026 11:08:43 +0100
X-Gm-Features: Aa3M54pPJggkTaxEZ8exgufSp3xG7DaTC8fi_wGV9VbwisqyDNi0qDOvXzZidkM
Message-ID: <CAL2JzuzBNTCAQBf-O=bJACLbVBXRM68VJ+KE7_W975X6tpTktg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/x86/amd/hsmp: Unify per-socket sysfs metrics
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>, 
	Suma Hegde <suma.hegde@amd.com>, Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Erwan Velu <e.velu@criteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi !
I'd love to have feedback on this v2 which tries to address the issues
reported on v1.
Erwan,

Le lun. 16 nov. 2026 =C3=A0 16:52, Erwan Velu <erwanaliasr1@gmail.com> a =
=C3=A9crit :
>
> From: Erwan Velu <e.velu@criteo.com>
>
> The goal of this series is to ease server monitoring, by exposing the
> HSMP metrics the same way whatever the driver, in a format that is
> straightforward to integrate in metrics exporters.
>
> The per-socket HSMP telemetry attributes (c0_residency_input,
> ddr_max_bw, pwr_current_active_freq_limit, ...) are only implemented by
> the ACPI driver, although they are plain HSMP messages the platform
> driver can send as well. Systems probed by the platform driver therefore
> only get metrics_bin.
>
> Their location also depends on the driver: AMDI0097:0X with the ACPI
> driver, amd_hsmp/socketN with the platform one. "modprobe amd_hsmp"
> picks the right driver, but userspace cannot know in advance which tree
> it has to read.
>
> This series moves the attributes to common code and adds an amd_hsmp
> class with one socketN device per socket, registered by both drivers.
> /sys/class/amd_hsmp/socketN/ is then the same path whichever driver
> probed. The existing ACPI and platform sysfs paths keep working.
>
> Patch 1 is a pure code move. Patch 2 adds the class and wires it in the
> ACPI driver, patch 3 does the same for the platform driver. Patch 4
> exposes the pwr_current_active_freq_limit_source bitmask as a single
> hexadecimal value, whose interpretation can be centralized in the
> monitoring stack (e.g. Grafana value mappings). Patch 5 documents
> /sys/class/amd_hsmp in Documentation/ABI/testing.
>
> This v2 reworks patches 2 and 3 following Carlos' review of v1, and is
> meant as a basis for discussion: I would rather know early whether this
> is heading in the right direction, in particular for the class approach
> and the AMDI0097:0X ABI question raised in the v1 thread, before
> polishing it further.
>
> Changes in v2:
> - Replace the separate /sys/devices/amd_hsmp tree, its root device and
>   its hand-rolled refcount by an amd_hsmp class, as suggested by Carlos.
>   The kref.h remark from Ilpo no longer applies, as there is no shared
>   object to refcount anymore.
> - Platform driver: the socket devices replace the bare socketN
>   attribute groups. As class devices land in an amd_hsmp glue directory
>   below their parent, a socketN symlink keeps the existing
>   /sys/devices/platform/amd_hsmp/socketN/metrics_bin path working.
> - New patch 5: Documentation/ABI/testing/sysfs-class-amd_hsmp.
>   Its content depends on the AMDI0097:0X ABI discussion with Carlos in
>   the v1 thread, and can be dropped or reworked accordingly.
> - Collected Acked-by from Carlos on patches 1 and 4.
> - Rebased on v7.4-rc3.
>
> Tested on a Zen4 (Family 19h, HSMP protocol 5) server with the platform
> driver, and on a dual socket Zen5 (Family 1Ah) server with the ACPI
> driver: attributes read through /sys/class/amd_hsmp, legacy paths
> still working, and 20 unload/reload cycles of the driver while reading
> the attributes in a loop.
>
> v1: https://lore.kernel.org/platform-driver-x86/20261007125908.321186-1-e=
rwanaliasr1@gmail.com/
>
> Erwan Velu (5):
>   platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
>   platform/x86/amd/hsmp: Add amd_hsmp class with per-socket devices
>   platform/x86/amd/hsmp: Expose socket attributes from the platform
>     driver
>   platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
>   Documentation/ABI: Add sysfs-class-amd_hsmp
>
>  .../ABI/testing/sysfs-class-amd_hsmp          | 120 +++++
>  Documentation/arch/x86/amd_hsmp.rst           |  24 +-
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/amd/hsmp/Makefile        |   2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c          | 345 +-------------
>  drivers/platform/x86/amd/hsmp/hsmp.c          |  19 +
>  drivers/platform/x86/amd/hsmp/hsmp.h          |   8 +
>  drivers/platform/x86/amd/hsmp/plat.c          | 155 +++----
>  drivers/platform/x86/amd/hsmp/sysfs.c         | 435 ++++++++++++++++++
>  9 files changed, 681 insertions(+), 428 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-amd_hsmp
>  create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
>
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --
> 2.53.0
>
