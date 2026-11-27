Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742074;
	b=ZdTqHYmh0SlTmXqtnrRd9wgtDCMyJjOLt6k+GX527UYOizqE7EaErQjWv6Vpgtp/U0z7
	 DpUq9OJovQDV/JnCPQb35YBQw9KoHUOrOYfq5+6SttZrYTfwbiwqJsPzhQlnm2x6SELZq
	 a79H/UREVB6dUGyfnyoatcxmTHCiuQTtoWBVfREgKMQQ4R9pHdYtkg5cmWG5X4Z8goqRc
	 tcAqLFLOKRs8+kpxm9vgP0Ak7e1ZBrvzpXqNKY090VbVP+TBoMV365h49Z4q6OcXtspme
	 pGYnbGlLui1C6wlt05hhFNN320aSjcRfM/o5oNpjLPdICB3uzn9qLXHKudMKg4WYzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=;
	b=GhOU9pc3e39n+HwIUXZzGCWunnZrWR1ZT+YQYcbw2upZf830U5kI/DQAKGU8wEyRkCHj
	 JdGmU4hD/xuD6UvlTAlK+/Vhot1Zh6P62NpDe0YO6qyxBnmCjY8YSanJDtzI0vNRPuRIP
	 0kGu1x2kOvIQbNvKEdoMGyUaOzPE5xi+Z8/uQ4Rr9OU99pW415jLJ+iqfHOfz3xwZ/DtM
	 FFrDib2qbhvu53UkSNLEjmf6AV4LFAGiubZVTu1UQZBO32vr/XOq1QDL6+Si7QuEAodnl
	 wd09zrj2keEM6Vle7OBUEiIFNW7VCf6v38kOrRtAsewT5OY/VjSbwSpkexeIZvWgE8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmOzr30c;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14916606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14916606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmOzr30c
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3082422a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742073; x=1796346873; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=;
        b=hmOzr30c+0qgpXbHWE5P4GmRbt5ZUi11M2NqCYYQLylThd5knPq6PJ6ogs3KT6vEF6
         JZX1M9FEsE6Q//IT9/vUUxgHLdm/tRsFFmGgCjhDErrqojsROvjBDfRKlG2bNr9yGf3D
         A5Le1zG0zhl/FfMkTR432M2U0kb8uR3p4vYjh1JJ8OV+p7EbAJR9zuOym0EdGHcyzjMy
         Cf0sKL16bmabvYS4p45bZ2Rub9ppW99S02ysbKY7tB/z6uy60sMC+Sw4qFhDjYTieMOk
         tBBPcZ/q+Bm2vRweffm2bNerpKs9TJJgurpFS6PT6Db9hrWCjb7Zd7V9QLxCaO9NIWIw
         igAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742073; x=1796346873;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4QuyiSQPiIDTfEJTEpYvEBkj4Se4WoY6XU6KWrukd4U=;
        b=UaYZWqp9D6jKjtLL3Al18xZJ+XoejtuNb2hjZqAC7rVnI3ffMO8753/vfVe1mRVQby
         uLtXPuZOPRM6PigNmcc5h4uhOwaShYvZM3VUzKYlQHyzFDAsYuqLRTCw6uSdVPtTRwTL
         UXNAJs9nZt7XMGIih6eC02IumC+PkEiJlFfqjhCTqAYSMHMkbfuiiPqvMqJr0GHy/swb
         hXoLL/7peJdVlIIsxIp/0Kxlg75ip1M3039oKSDJnx3yGXKK3O0TEJHVSTR+z1MC93jl
         utZ68eSNAo45giUZBSVG7reV09k8RyJvwMIR8m9p22CTDMHuRYU1PkFKfAlWINgZ18Bi
         +0QQ==
X-Forwarded-Encrypted: i=1; AL+hErGKM+qkJfTylYahtIQuUq4ADsSqyUHjBSQWWhfDjFMMxAq2YhD3jGyjqoBWqknCIsLUpZdYhHRZt+mupo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SlDBcwLQK1BKi/06khSiBTFiOmeKaVl805o066DnlLKdnYrUB
	YcyxUmFk6uBAe02h7ZA/z3/nGJKrxCZHla15V2Z9Galu02dIfxEhCLAm
X-Gm-Gg: AZFdTZdSHoITI4868OiD/b7818/VOSbu/9Kzj263dUGCuPWP+0lX6TQ4A5f9s3gY5AT
	CyKGucVE62EBeB63/bIcOb8YnG9e3Lt3i7ITogFKrnrPVdBY084xbJk8/l8nKJqIUgBqJNuJYpi
	3Q12lhcP/Ny970i2KXvPNq2deHPmGc2COFtHv4nu4tJ2S5DRm7AqZLCbAF26uEQbrcw2YAWKQgV
	YM2jhRF5DvaKWJeJq7wggYnxgao4DW3kbnSXX9FtznjAAvWzm2xK2mGQrzAp+Uw2obesf9lSQwq
	V9Po7nxXRFm8svq6pv3l7G9hoTDl+tYAKOK4Wfk/RygU0u9xJDz0Ofif++oCErpQPzhqIMgz0/W
	CDG773+wXo21wK76ZcD7Tt8p6Hb4ZuLzQp+TqWnuZQuVL7hY5AkbjaBLvxBtHLE1WTy6QXw2E0x
	EASUaZ53dC5NPkRyejkxHMGBlT439cYDfgebn4A0OBREPo6+6A6nAuh11iiIiWOJmCFOjYQWn7F
	wBDnnYCBY8/JtCLnyKez8pcVAo8kOS6hDUGTOpCl4xETR18Ge1n4V9ZMUgff9jZK4K0LZflJHAC
	1GmwtvK34Npv0wrSIWbhUpMu2UN2b+cS6oox5Lhj/tk03mozILiC20B6vQ5RRM/eeU4mfu9d++F
	BtZMkfhsklEIjIXhIKDnC
X-Received: by 2002:a17:90b:1a90:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b41c92a1c0mr20960400a91.33.1795742073166;
        Thu, 26 Nov 2026 17:14:33 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35005235a91.4.2026.11.26.17.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:14:32 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: stanley.chu@mediatek.com, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, louisalexis.eyraud@collabora.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] scsi: ufs: mediatek: round scalable clock bounds
 to clk_round_rate()
In-Reply-To: <00ba0aec941a72c8401eab7c3d4036caa2ae8aee.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-4-iasnezhkov@gmail.com>
 <00ba0aec941a72c8401eab7c3d4036caa2ae8aee.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:14:28 +0800
Message-ID: <179574206826.56397.7920531590189565888@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Peter,

It is not a missing hardware calibration — it comes directly from the
fractional-N PLL PCW quantization against the 26 MHz reference crystal
(clk26m).

On MT6789, msdcpll has pcwbits = 22 and pcwibits = 8 (14 fractional
bits, 2^14 = 16384), with VCO range 1500..3800 MHz, and ufs_sel_max_src
is msdcpll_d2 (msdcpll / 2). To target msdcpll = 384 MHz (msdcpll_d2 =
192 MHz) at postdiv = 4, VCO = 1536 MHz, so the required multiplier is:

  1536 / 26 = 768 / 13 = 59 + 1/13

Because 1/13 is a non-terminating binary fraction, no integer PCW value
can represent 384 MHz exactly in 14 fractional bits:

  pcw = 0xec4ec (967916) -> vco = 1535999512 Hz -> msdcpll = 383999878 Hz -> msdcpll_d2 = 191999939 Hz (-61 Hz)
  pcw = 0xec4ed (967917) -> vco = 1536001099 Hz -> msdcpll = 384000275 Hz -> msdcpll_d2 = 192000137 Hz (+137 Hz)

(With postdiv = 8, VCO = 3072 MHz = 26 MHz * (118 + 2/13), the closest
PCW values give 191999939 Hz and 192000038 Hz — still never exactly
192000000 Hz.)

So the CCF __mtk_pll_recalc_rate() / clk_round_rate() result for
msdcpll_d2 is deterministically 191999939 Hz, which never matches a
nominal 192000000 Hz entry in freq-table-hz under ufshcd_devfreq_target()'s
exact `freq == clki->max_freq` check.

Best regards,
Ilia
