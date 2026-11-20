Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176796;
	b=AvjxwGOudqiphpubRZgiGrmcoslo5Bpt5vkQJAxQSAUCHlaLB5rl6GIkm/FQk0HEVCum
	 YYy4olaWf8LJl5ebP67oSJm5IkDze4O6pxxbX2pWf0kwjeMCiKKjgPfdza0p88PGrnhSg
	 FE2jomUt8IGzuWNNTYtCCDRj7gl+E89rUUuc78Wg4a2kVWMS+MaWkoHswWPwHj+rTOZ6x
	 yZIhWWBuZslZF/DVVdHmRRV+JbkfUvlv3P3jcs957cuJBJNHpjuaBfiYXpHP36TxZf4tm
	 su3F84miwjBSyqUvzZ5UZva4DaS0FdgJfzrJRcP1zmhMsZxxI83GgOo/IKDyQFFa9IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
	b=hhC15dHHEApHDB+iuCyO7n9xGgwSKB0bTjzMcwKm6/4t7GNppN/TTTkA8VRRjb+KrtQk
	 wFvfzqz7jua41lJMgbb4Es0g9hwpBiCb0/e8VxhbWvC8IrOVjWzCOJEQC44X/NlhQmgnj
	 cJHXFHDJY5eVERvcDEND6KURHdcZ4i8w652FhQoerCO7ahlZengzNxij8JiLCWrCCHKUw
	 JbWnGA3F8jIxLjNIVySzGv3WwBsK7C5I8Y/kDOpRG87faGt0YhsuDdhjF+MCOlbKxh9cE
	 6X7+xwC8mLe2b3Ge4xjA7gSWMVORUv8Yq8Kbl2N+R8TSG2cPlHVCoC55UqnQ7VTNZXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2hKjcXw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BC606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88BC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2hKjcXw
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae6a0ffb55so6035181fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176794; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZ+XzfsoGlCB8NRuW2ko575VvucIugwvHphmvu4khwXtjpuLy1O9YtkueKUZTU3pxc
         8JAxGrQnXWA9/XB3q53jPjHWB0qfkS4kIyWAYR2COdgz0M1dGRni4QhH9Y+5VGdgGTef
         U/IPxZCC/dpK05qOHHImiD+36+IhWQV7nOJW92goprE+0jdylw5yGAoPnMIYZEAaFseZ
         64+krRG1ow404fDixuJCuZMo+irNjXP2LN+gD5KXYLvDSpVuRJa07Q+8G1w/61y48D6L
         t5xg0HoW4nGHF/QJfIBO/wakeWwjReym7J1Wj6dW8MxvfKvadekF0ll6zO01HGpYjuQS
         RMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        fh=EgPAioFghrk0mdOBoEP897ts+qTv+BcrpIc2Whz5y1g=;
        b=QsOk8JJgqeg2k3+e4XRzy21BjQuzYgpMNPb6gDdi9RJ3AO3uG7glYLAq2ejcPIwJbg
         R5A91aC6FLEZyNNPlsZQ2SOmyxXrS0xNnkk46+Qfvb9zGXhsZf/K91CvfLGvse71/tfT
         jGIVuMMYD3Uq88AtNqZluOf0LMX+hkE7xt48qOxrOXqPIYTyEE+FuSGAoGJyGJnVMTj7
         qo5C9qPsRbTOb9N7KujNMi0D+1SnSRRR8NRL4aDj+QdOPIhDdKMOzsaRxzhEtXTaFXAy
         m7gXSFk8FpPrqh2o4qwEd7b525h+xOhIuZo0GbpxFcza+uUtu/pBqt69u6JR/hqEpIWj
         d62A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176794; x=1795781594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=L2hKjcXwbx3DvIS2POAqz9jYjZHZ5sTJ+nSQ8kHtcsPZNgcWWJCNYUnmiZKbq4gyE4
         H24B5ILw5MbSHky/FcU3owDeerrfpFVls7ytn+sunOwc9C88RKJbcmt0YpxGLP1M/TOd
         FbvZyQmPtDMas3hW0BuqMvzrD9b5pSa9frHVK7i3I35L/72wYSqBnAN/txFqLpWMFzqd
         eXSG3AVjv/BNal240Mhm9lTRZA0dJm2tRi8tWWZDunvYrZIcyMekWtvIUY9Ldn0htXht
         odJYHBMxXLmuArerilao6ir+hxE5nxihRok/zca+D401llOKNyKJuEe6K+3Xc48Iz2Kt
         nyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176794; x=1795781594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=DseAHdgVREos7XG9vveVl2h99IDE6gfJ4x4W4nLm0VbCaG/ys27V+shCa8imPpL8lp
         SafkcSEyvDMJoV4fR3Gh44Yj6Dm/+7fh82A55K/UPl3tl9tfrErcC3fBrNDmqUj+Y1fO
         rJxSRBWSV0G2BF9IVQ2pmTuhVCGayE9R82OhhgDIq3id/T3yNbRO4wulMIlWMMe8Fl6Z
         rDyt/pHGMTCrXGbdinqAnnbG4uwZ2+6g1hr8Ay7lwy/tet1xH1lCb5KFSq9Jeugv57iN
         B/J0oURMXe0vHETIT2XIw6h+eL4koB15egtAMCSc5VU6Gr1dnbjEBonRAdWa74prVSlX
         jsHQ==
X-Forwarded-Encrypted: i=1; AL+hErGOtqR7rCbVmTd0H3XIxph9CA4bByY7Y4kWA4yjCfqBrPb2o7TIblaUjk9vtKmWtNopQd2w18nDluESO7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UwKEcybQCNl9f7nxsYQlIjkyF1w2lLOqS3CCGca0AX/Cj1UDZ
	MU7pk//LA+Iz0mWIheOBGQIaDsEjeeO3vuv/Bf57UIfamK1bGCdvlAjffJQK0p0FYzNpNslIlDb
	2HNwSUHxNxlC2eD9euMZ7Y6FVYjMK8dY=
X-Gm-Gg: AZFdTZeqCQ6vbuBu307tXyT/SSPL51D6V5lTCcZq82AAzu/mvN4Hw3mlf9Uxbisvbk6
	MKMLEy29d18EyAXkEcWJFH7vv/i2jsVbsx4SY64Yi0+O4q8yGrSdkbPcCF8Kc5stoPzuZxyUu4q
	x1eyD3dYvPVh1MUsuFDYGFwt5BdINj3LB6y27BsHMUcZ1tKR5TyZYw/xhNDV6x/yGoFC7Aos5Jn
	3k7qogoE1SjOjCNZjXwHCvZavZdygca5Ko+c28vJIue+E7LBIgXuqh3OFZwsXkHcMfCV56fWW9p
	zqZ0n4ZH7IyZ1TMsGfZtpmnGVTUSZaZBhzoHjKCTehHbYEVeRTqQgqq4bfM7u/4BUYA8NCZ9Ebp
	Vr6SqAtXnGiZ7uYB07F4iuH2yQZk06oZpP2vdZKDYa7jImNjXaxFzvbRCdDXYJZDD9pKnokICEW
	NEtf/cpDI1vcvZt99qEFfDZjFl
X-Received: by 2002:a05:6512:a78d:10b0:5c1:46c8:4797 with SMTP id
 2adb3069b0e04-5c1bc7d1153mr604351e87.17.1795176793721; Fri, 20 Nov 2026
 04:13:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 09:13:02 -0300
X-Gm-Features: AclHuK94xOx7RNiFqLMbC6LRL1dQuiXB8r985LNFD94WYgXQMJhVIsyDHnh7OLI
Message-ID: <CAOMZO5D4KV_v7w5tcLn44UsMxpOFDQwr48b24Mx1Fy+v_J-WFQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:46=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
