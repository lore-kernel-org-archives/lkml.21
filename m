Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378471;
	b=AkGy2YTmnqO+aP467w6GPm+rl/cpJk7fCR0L+i/ShBoFHiXoPlg9+3Nraq8L5ii5zXvl
	 N9wmwF83/sH81Cj1B/wCkf10Esxt8BaQi+GgLp2fNeQOJggxL9tQbLHz+0JrYj78HBk45
	 EfA33R1dhOFKb0soz73uMF+IHDpa0vgboHsWyXdl/gX8bL6AGoLg9Q3s0+k4OEvuHpFds
	 f9K9MCRmaqhPc3cQInMzdZx1ghEtjq/I+rCdFLQJS1uf5ckBkuK0PSsYSqgVzlpes45Lq
	 BAYToUof3ZCeQ+EWcXAPCEKed+0d8ajkr3vW2T+nekd7bvzZv5FFlPl8QU70d6IfAgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
	b=kkpop7RK4A3SsYdX+0ER26lQXCfjx3rO8nNzObgNt6rDDVrLV0iSW9aMrSCxH04rXzG7
	 mbWg/0pZXet/gLaravDqFW6JmnEs+5gT5WC6TfB+5ysxk8yyqYqz8cKC7Pz+o7vs2yfZn
	 hY6YHl3+b3h6+S+IpFf2ccuHmOpILbo1bOkqkmGsrdW8AiLjHBNkZcL6iM9Cm72Qd4x+X
	 bWgNAZj1pRPfo3zrJCHL/Gfh6EI+xRcEQ7IMMkKzN/nb2Aa4bJVu65VZMVw5JrhHejzAM
	 8Fo/rnKWo/St3NrajtYFq56oH1TuTVY5JlJiUvhHWZ4zX+EdVDpYdNNVfHMe/rGywug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8F606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD8F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2799233a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378469; x=1795983269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=aUgCUsXHYw3KaELR4kFag3t5wB9TMdvlrPOCMERQdBo6tE9XrKcTfz2uG8UIsGa2BM
         njA6POWPRJA3ichnU0xFmq9hKVOYjVx3NCMAHHlQEODE2reX+M5wYjKoxgrlTnM6WMk0
         gy0xblA1L5zSG7+RBF+sV2Bq0S9jS56bcVppIwTO7xDiFFFzEq1Tc3zgyaC2XwMyazSP
         FZumSKEduASM4h1ETwbJe72L2CiBxGfUkZyHsoKbxiMMl/GE+XCQl2yHyY+NNLRtL48n
         28ErKSMtnVdEQ3p4FOAXYrI2bVD30h6Dfl6n1fz6Ua7XKaPN46zsuIONXiApnGof/Afc
         MhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378469; x=1795983269;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=B/Sramd735HEIs4h29iybMXEH3wfU7RbkjqfOz2nuLS3/782TWkBNexSRPqJQUC5H0
         9cvMCPf0Px21XKuaRRb9Duz6Syx/UkjttR0Dxw4nAM3n7RPd8FxmwjEUelArHLzgMAzF
         gsL5m5s7oF1KQc4TB8V3VqpGfHH9c7ZdUHU/60oOeIGhW0HInDqEBNGY1DB8yk7s/hpE
         CxyaQ52TsG011+dr2weTzCpBfbRn5V02gW8VSY+ZpvNGZEdjrIOguxoVrGNDVtPDNwrT
         WI5HeqKKHLLNZwqLCuGGG7G5PfRXKax65inEkqzZqTIycFPBrCKCR+FkqPJxhyxT5+i7
         b4Lw==
X-Forwarded-Encrypted: i=1; AL+hErH1y1hdAi3yBfQW3aKbTadVbRXs5Ih74uFww5wtVnkouJuVOl+jvumDlfcpRPCXzTyAbk54JVGw+IUlqj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WymTdUg3DyWu6T2ZUgbqhml83HJJFnqbc8wmpQEe5VIr5CwA2
	ihzaJt0nGc+cl635cwSeI+9dCI5gTvA6pzfZnxa+KvdNpqYxt+r+Xu7D
X-Gm-Gg: AZFdTZc1CO2RAalDCIMbOAe7SuxTCW5cCfxcyBb8hho7BpIj+HXJO4hCZec1Q7C53DR
	EWLRvTYMRdX5lViQ2WoujFZLkNFQAITgEGPFcBiF2VO+oXkNXGunt/rGRIN0h13x4RgrP85Zyx6
	bh4/wUHhM8X2eAOeSzSTFEK2jGK2zwvkGwvtmhw/bjfqoXCYdKJoNP+gyWvQelMYF8bl8WFcs4m
	0ynP9TpB8Z4cJNNh4MVN6np56RCUcFBH6rplO2p/qEuIr+rJwNDwyg7snd/elDTBmBk5LE+HkER
	4rhXhAt3NSMo8v6rn+GVvGfzrLyx9LQrKaaYzOKy6daA2F1F4zcN3zHAnnZvftVADSY4/O/7Vi2
	sIsKeUAPSjfhbbcLD+rAhkXImk7XhfMz7eNbVLIROuFHpS5bvRG/DgTkMAYWO8qcKCwEAzfA9Xq
	jXvTAT9xCTccFaKjf2hyv5aWfh5/FU4DPPCFCb1ZHya66e2ZRJ8HVmQjhgP4KfhFICV51Xxadkx
	HP87RmD0IS9jkVOcibjjPDhQuoIrw26JkH/TvOM9/g3EYbIpKWtCb6V81x+dySbSoWKfBzljay5
	1/CqMyp9l6BmCHI0tYlkaUTANPzrrgSCtOadhpxNEqRDsRiUGLiiRbND802H8bu1bBHvgmMZK2D
	au/lGHP8LJg==
X-Received: by 2002:a05:6402:501c:b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6ba37edaf1cmr6652717a12.42.1795378468547;
        Sun, 22 Nov 2026 12:14:28 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/18] [WIP] ARM: tegra: Update Tegra Note 7 configuration
Date: Sun, 22 Nov 2026 22:13:49 +0200
Message-ID: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch set is more a placeholder and is not meant to be merged just yet,
I am still working on it and comments are welcome. I am sending it to be sure
that my work is not stolen or overwritten by some AI slopper with a trial
subsciption to a fancy new LLM. Thank you for understanding.

Svyatoslav Ryhel (18):
  dt-bindings: ARM: tegra: Document Tegra Note 7 variants
  ARM: tegra: Diverge Tegra Note 7 device tree to support its common
    versions
  ARM: tegra: tegratab: Upgrade powerlines configuration
  ARM: tegra: tegratab: Add pinmux node
  ARM: tegra: tegratab: Bind VDE device
  ARM: tegra: tegratab: Configure USB and power supply
  ARM: tegra: tegratab: Configure MMC devices
  ARM: tegra: tegratab: Configure wireless devices
  ARM: tegra: tegratab: Add thermal configuration
  ARM: tegra: tegratab: Configure HDMI
  ARM: tegra: tegratab: Add audio codec and sound card configuration
  ARM: tegra: tegratab: Add common sensor nodes
  ARM: tegra: tegratab: Add MC and EMC timing nodes
  ARM: tegra: tegratab: Add CPU DFLL clock node
  ARM: tegra: tegratab: Update GPIO keys and switches
  ARM: tegra: tegratab: Update aliases, chosen and memory nodes
  ARM: tegra: tegratab: Add video input configuration
  ARM: tegra: tegratab: Add panel rotation

 .../devicetree/bindings/arm/tegra.yaml        |    7 +-
 arch/arm/boot/dts/nvidia/Makefile             |    6 +-
 .../nvidia/tegra114-nvidia-tegranote7c.dts    |   14 +
 .../tegra114-nvidia-tegratab-common.dtsi      | 2759 +++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  603 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 1405 +++++++++
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  341 --
 7 files changed, 4791 insertions(+), 344 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
 delete mode 100644 arch/arm/boot/dts/nvidia/tegra114-tn7.dts

-- 
2.53.0

