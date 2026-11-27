Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748352;
	b=pQyTX7duq89qm4YkPmkArpMKGGFTWpIRenzJM/VWBgTt+IBPZY+/UDupXm23HZyL/w2a
	 CJ0wTYf5R7S5bsvw3f/A61+PNGj26dVq737grvAk7t8+cpK8ZTpY0LWDEuBnrGjqtqgid
	 9QcSCwNn3N61j1OeRBNAAfmzHj47xkdxdTM/YnTV2+vX43Rzxrbbg4Z3QSC/3xVU9uiyc
	 2Kswu1H7A2RVis7lGypJ965ncXLR1Q3xBMRxdtImonnYTLClK5Ry6tHt/d/mZ9sk1Wwxt
	 kd48GfCdtGllmzgr8/ume33HfiWkJoiIExUOugf6V2g1sF8yZf/aWt8Bv7Y4gPQzYqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
	b=kQ7dp/sEWrde1iI4IVfp3hXy3PcKBuVY+bYCbFFR98PXkDyQC0Shac4qTGUnQHvMphlY
	 zk5QpNjvWYXV6x+BOToNlJxIzv3FsQNe2lUtedVBs3+F5HLiJGo/eewMynBlSzIJRnWdR
	 08flSctsUZsWI8BBHoCz8SCffKv3wwTiqazv7QlxZTeG9dduYwwfnLHz5FrIUroX0k4Y7
	 QfLkNV5qVHypvGF5C1se3VKAaB9pda3ddZB+6Z8gEqi/t7tfS0DzA1Ltk13lP5+orSfAD
	 oFRU5cD1Y57tY3uoxCKOJFanp8+NUVhciWf/dspkcdc1NnDihrJYEHA0vQdnUiWeGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yiJj9l;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08696606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08696606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yiJj9l
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so4328372eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748351; x=1796353151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=b0yiJj9liKtG/KBF/XftFlq5Rz284tx1BiaI0oOkTm4BOWDc8pjvKd4OjnGfIBH3dT
         zZWVqPVetb1yHamv9buz7hcY5Lwnr2A/yw1UgNYxuymWb0pi+HsPpEXB22HZsNxmpoxp
         pBGFcVjsu39wYc7qYnMIEaAcTfmddA1Jmx5bw2OgtZFlTNCOZ9jkeRw8Uh4BdcuEI+Fb
         5+uRmw7zsO75XK+zOhj0tVHUTDmO+q77YA77TQMbGQgHhsent25dW1gyBDdRchHGEZwF
         gz+jVYjzOmoZVyfioFZrbgp5MERsWaC2KVKDq7VNZibdyXYkonFXLt0a4NN75Yu7EJDM
         kjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748351; x=1796353151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=nwpX9SwcNKbnIW6XM96RZTd6b5SDBvq38mFrsGCf7zDcjbBj2caMU96N1Ns+tPwTQL
         S06uk/FfZ1pKh7KaWzNN4PzCjyqJEXHqTkewDoR5eF9M/Xq+zzVb+49XY7pigw4RhsuE
         hy82MsnQlGay94a59eWkewDSMKdjh0mk9nwOjVUpL4eh9rKnOn+yg2leUFjDRrFO3SUZ
         3XiYSqC8smfKHGvj2zEudXVAnMSZuGC2E1mL3Cma/bJE2wdv/9wATY+/FlPNW8EixxX4
         qND8+73+edSSRGGUaFSgPlKcTrj4BX+4yo3wdsdfLuQwKryrZeg01uDmOWjarCtBTv7Z
         Hn1Q==
X-Forwarded-Encrypted: i=1; AL+hErEV6mRKbKvx40MddEnMr6VS9PBXcj5xpXvh6VEPVM/AxtvixRv8g4ItQvDe3++u+gezs6o2afH4eQo3G/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qUFVe8UxPKURHz0IFwnzN+gMBYeV74HYEXeq1ZrMU0LI+cxoH
	M3OyPyThZ+muBFTdjpXyEg2gZ54LsqbXKHROYu+QZYA+Rn22XqZ1kwj8
X-Gm-Gg: AZFdTZc2qIiM++Gebcrc9Tbuihhf4GbN7y8xjRwsqZTk0Rkikr1SQknFRzorMKbt0+J
	G3UI2yjE6MrRl2KT9l7A9AOXL8vWCuTVcFEAyq43E965FTzN/49fPgDrQH9FxwbS6Z1TwvgyrNw
	Wb4nb5FlKaGxKczRVBAyp1CZ3VE17FhfZM4iO93rpdHS9ujB8iIx4jU+zedqn2kvG6V0dL5/Fl/
	+UJr7iQH4SuH2UCSKytxVKLj/TwblFG680j6XepG9U9LHYus4xcKkm4/4AFCC0lGFu36419A0B7
	58y2T/ccZayVvj1tJwY4AoIEpVtmKvlK91iHPBrBeeanqjKQNAKw4cjQbHi/LpzM34B+FftQx8p
	ajIBCmw1pIv8+OebbLe2uo5lsxq7ITO8YQfJwWBflCHQoTu7O4+tyFRzDqj7grw4Rct51RYEo3i
	7H9XNRWNGM+M2bhD2exe4acAPpchqSsnNeeOfW7uFLtL7HfotQhtnFAMf3phQHnmiGxe0RxdmIz
	F7bS45PQQNtwj92DQsmGaTOMDnOjNBT/PVEsYEMbqE3DttLgMOb8ya+GtI1plew2Z46VIhnbQhE
	c1w4qpNFNd9giNbmaF77GHs4LA+vGVMgWciTlALZNcunvGQ=
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr1066918eec.11.1795748351083;
        Thu, 26 Nov 2026 18:59:11 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:10 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 27 Nov 2026 08:28:15 +0530
Message-ID: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Hi,

Expose permitted AST2600 OTP data through root-only, read-only NVMEM
for BMC bring-up diagnostics comparing raw offsets with reference reads.
The series also describes the SBC's NVMEM-provider role in its binding.

Changes since v3:
- Drop linux/mod_devicetable.h as requested by Uwe Kleine-Koenig;
  linux/platform_device.h already provides the required declaration.
- The binding patch is unchanged.

The previous v3 series passed ARM W=1 and B650D4U/A3 read validation on
upstream-based 7.4-rc1: repeated reads, pair boundaries, 40 concurrent
reads and comparison of a 12-byte range with a vendor-derived reference.
These hardware results are from v3, before the include-only change.

For v4, ARM W=1 driver-object compilation passed. Strict checkpatch
reported zero errors, warnings or checks for the binding patch, and zero
errors/checks with one new-file/MAINTAINERS warning for the driver patch.
The existing ASPEED MAINTAINERS matcher covers the driver.

Previous revision and review:
https://lore.kernel.org/all/20261121034053.39878-1-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

AI assistance was used for driver revisions, validation tooling and patch
text. Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
