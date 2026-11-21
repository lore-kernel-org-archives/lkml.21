Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281814;
	b=OsmTxTtAZndaQLmPrtulV2cz7LxVnx3eGasLEDNaZlkZrl0iQkgOckL0EkMabXXJGtJC
	 wliE52u+IlNkErib92neZmMDYMJx5M5+e2PqtxmfAQOvvhRSt+aya59ZD8DtbEAXwCKwo
	 bzJ6eLclfmsKg6DKSCa2qcDp3QwkPCvpQYxjGnlCP2HTgCISYU7VycDuX9VEVk8vZNMAh
	 M4M39CUzghuC8OLDjLtLndRcwIhduJ1VPFN+FPZ6pwEzW2+CW2MDH7Q8sZ44b6ggmZ4an
	 +WcPRVPGG9eFNPI752hOL+/A6bvPwshLG6V14bP0fxenTsOoIiwmtPUsA/LWZiEoTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
	b=uvoV3+h7cZ5QcuNOQ8TgREMNyHKKypUtk2ynCbyTiKN/g40bR8dDQ97CdjuU1CzFxr/0
	 7CptnqZ71ClP7QHlLBSm7RYQ0gQF5EUJpyj/uYlhwwmwGkPX9VSWyV27la/Aa+I7/AUWG
	 7keK/b53MlYfEQIAendfABzVWm9Y0JxW7+EBBURMYrWBGPICRb/rk+1r4JZlhMdpoxiCW
	 dntNRINVxbpdElGfqPZuSh8H9ccIa6nD4TjOdtWJDau7YjcCxAcxQl7dmYoTEOR+toY5s
	 2PaemoZAxFEAyUk20zGhWvNTvVWyFBJoie/1MR585HlBPfxZ09Red3swLdYR61ipACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11vgZXD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA84606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA84606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11vgZXD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3869f03af6aso643569eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281813; x=1795886613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
        b=R11vgZXDtT0N1QS40z2jBWPHC2Kg9bm2pjRcg3i9B3OU76zGxhVGRQipuB0fwvJHly
         w4JVWdT+vNjXzrfyALBi7YH+eCmry2WyWitMBFUxOdxTSU3vCv0oWbrp1ALvIr3+u0oC
         Jm7eNHgERnJ4ppODCcwQlrA6xeCUO/5e9Sb78/HU5PFfdwwFOEbnPWR42LfEYRd0cZm8
         PDKLsp7J+Q1ODvaWNdvLo7K2k7bxl9ovhMlOhnSO0nzrcZQSOJV47AgVhZuNSKv7hPwP
         GUEfzGZwqwWL66JKNrXRvqNReWkvoPH9jQNJKbui6z7L2SmZzrTkYT2jQl7su5UxWjcy
         mn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281813; x=1795886613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
        b=cf9LIWAgEjunxPqqZx04bg2ZA5DeYU6b1pM0XJaLcgq/rIaMLB1tF3LJWb0A0PI+CY
         INGuSgvH+EwfnATSu+H4NsMpU75rqh/v7/HGOafgJFUHrCD3ExcAeWLz/2of8ZstUE8f
         Zm4B+Z94J9DgOW52h/CQYhSw13K6s7d84wsHTR3LM+7eJzNbJ0szalxsgDO+8SNwaau0
         3PWHZUQtL+NZzbzRxe/R7Q9QAOqMv6TqapUzL6j3kfcSGZSFjs1fyY2huAsYdk4ZMPXz
         rkOvCBiBULDDJ/8lv9uzIDGTgmaY+xwaJuO32XuSLlVmzmoXzozbIZg5HdbGaI/N2YFa
         iJDw==
X-Forwarded-Encrypted: i=1; AL+hErHf2V69Zr6eOWBozqPlWLrB/iG1t4xj57c3kNxyAlVD2dv35sCXVAw6Y3DtUydtYH9X5go4qGA7JQmp5T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w1PhATx8vfEQjlqCJBzM+KMlWUk/nY9CCcUU1iLKTC6e4j5YN
	7NYSfScvHi7AHAmOFO1gNgdPGFDG+UURINdHrpDldtG139AMR4T1nC2MpxMZxz00AgM=
X-Gm-Gg: AZFdTZcA5appJ4lmPkVIifkmKqWVdI4un+SoG5BJ7+MAB6rFU5z7rPvyberGSNSvQfU
	GAs9YpJ523ZluyjM1dHzQayQU3a0TPguCHR6hqiNHlnV8AFJWrZzzRzRCsDHN6T0F3WOkqAWDUg
	mOssYl3wWEzT4QPQBu8Bp2lt+28wTYkSg+TEnT1Oo9V4q8sVK5Zkp4b/PdMOx7nRIC1hoAoOiLP
	Izw52eIsz8bsIl3ElsolMvZ2JQlyqWaeNJFPz006MpDJ0d6ETxnF2YgkvKP3ne62Xuo4oV7KjC2
	N0k94BRrLH4EK6nOdZ7DHmk1E6OK1YP66q352lxQUlz5bNvvCRXsyXVnb/ud4PV8iVyKJqTX/ip
	ZMyUb56Jhg4lEbpJ2CbLvzZPFvUWJBTDSbsQLr7Gt+XWTRND6SCi7ecDA66RCEZovVm0ukhSBKQ
	p2h4YFiyz+xH3ICgD/vz3meq+NRjF0h5pZ7+cs6XiZfjnnkdsvMYjil4dE4Y6PIyYBXN/kBn9Th
	rf/4bSB7xLtXLna2p7aI3p7GheOHLCc8nUIWXnDgpfkgOaAm86zG0MCysFHLPZ+vcCPUCbzvZyj
	Q1ZfZ92F+1irhscfOhiv3JryFV3KIQ/Z2rRX
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr6911423eec.6.1795281812915;
        Sat, 21 Nov 2026 09:23:32 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm16633136eec.13.2026.11.21.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:32 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 6/6] Input: aw86927 - stop playback over suspend and on shutdown
Date: Sun, 22 Nov 2026 02:23:31 +0900
Message-ID: <20261121172331.863-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-7-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-7-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 17 Nov 2026 13:21:12 +0800, Qianhui Xu wrote:
> The chip keeps playing whatever was programmed into it when the system
> suspends or reboots, so the actuator can still be buzzing after the screen
> is off.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Rumble works before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
