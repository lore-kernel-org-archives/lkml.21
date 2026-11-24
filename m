Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505372;
	b=L9bIf+Zibtz9gwmli5YXhNGfgyFCBEMZgX5PGrUuev6p/1Z4KiEzSh0Tra9eud8xHvpD
	 QtzvfO5kgerJ6f4UXJrRFbr+oJvz5xXfnOVRUBpVVSjSoQr2qsownbYv/IxXqMbFhSEoA
	 DP6Ny1EWu/QcyVS6P8P1hRxLKsZyM68tAAO7Z9mPHLewpmIxWageAmJwAhXNdXEAblpJT
	 2XGgtAX/zHVSzvdf9pZJllRPIydzlmO7aeJwmqXtV0S2WUFt6w4Wjkok81kQEKH4aeXHg
	 EjxKXEnB1ZWxxRotZR/EcqBc2whnYEk3Wg/8wLfh83/JlV+FkP4QYkb+CEnJIadLn4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
	b=HgZsLNL5n4c+X/q4plqzUZXnMjFMIjmnuvn6UD0N98dYtGBIqz3T7R39MZfwR7D2Zjxx
	 /55wCF3SWGPX0Tli3XtL6+Aff3PdolwFI9rUkMHqy+UpMU4JFJwNsm0TPDps04sNvd26i
	 XQclNt3uXuuK1uEzxTOaYn75qDZZjAmsDOjbQGlf2Nf1QlOs7D8pU8d4D22kgetUfaAjS
	 eU6/MJiqxIIE3O8/+JtbUpMqt8AH4/HgD0iWalBvB9+pdhuQy4WLszbVemW/ai85q5gTX
	 wKTFqgFufl7nJi5VwyWDAX3e3goy+5CLbG1mmZhsNTA5Z0/XE3F33pRxLMQdWLAm0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axi1U87p;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1ACD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axi1U87p
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1361804b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505371; x=1796110171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=axi1U87pEVbP1X43tCTM2vbccayBtnw4p02G/pqB7/99068i1ImIQcW+uYL5f+f5kA
         fjP27j+9kNvNSsEsvibdTg+lPLYTH4oXuBgsM/hBPywyoSKDMsQLlhltWh96ybs4LcCo
         HuzQMxb9Bzo3PI6N8oGbtJHX4vpg059UOsC55YukHXyhYj+ipUk17tRaiN5n0c6Q9g+z
         Uo/+0QlrU23sf7pgbHS0HK0AHcYNPqw+K1GDCOjeb2isWmHMLZoYLMO5fEUeMODU3Ke4
         MwMvREpjhKFXyY/Zb12wP9C5j7LMdp6jl3LWcnHHwqNFaVJF0KMyNAkNx0BDzN8JTBz0
         +yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505371; x=1796110171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=2TRdyLbZA2hpkN4hJiljXpMXgPsKJaGfEsCMf5VE4kWGI2DbHCNqQzWs7JwqKcEmf5
         Rh/fw3M1gl8uyuZ+AB/xRWz0F7pvWIa4Ff0dcVTRe4qLt8PDaDRI3JHaAU0p2q+i1ooc
         vXMOiOzfVj9izxSR6Wqd9KGQpgvoeJqlyMb3xKfYN1D6INgOZ0MPowdVoiAWuXX2Mc3P
         ThgoNuCqQU9uHruVlLnXXOaXg1rRJBBf7nLzPEZ+Naaj4EOqwlJ4gFweM5EQtD/Yz6Yq
         7kmNMtfP9nfyMZj/AtkdIIpRKg4j7jCdvx6PL7ds9rgrxUwdec/Qd7ZOQsQbDSDJfMV8
         eROw==
X-Forwarded-Encrypted: i=1; AL+hErHIv8Uonp00rTQcsIZHDxIXf0rE8SjASyhjfz1NKOI2eUuFGNquATe6y5s40OF+HE0h9pm6XB1+IPWb+gM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wV9wjVg/nqK4ZONF2t+EACNd8fAERRD2/vZ2NQnclhWdwbC2W
	FlANbLR1hc6Lw0uk8H8e7JoC9GQgN2NoSmvOQhjamFMjqJWEg8WfwuEw
X-Gm-Gg: AZFdTZcCnY2Bpxfr8SsIN0UMdxQXF4VBc8MP55VEzCjpTfGQm2vLP82jl4pfjlXWQLj
	A8ymAPiEVzHTqpysWrNesdV6h222noQVC/4KqR1RE9HnWgmsSILDNCeDU8zaY3pnHnOnqQ6NAyT
	F4h7jRDCqrD8o4DkE6uyguDjXoPmiEyiFxFJ/dy2Un8n++pwKXL2ddy8jfiq6L6p5HbQLNoRNUM
	cvc7ccrlS6ld3uY9D4aIbjQ6CMloIjhqGXm1i+EPDT/C7Kjcw3IbHCqT0m+a4ryIkmoERYqalnC
	KQYz924QUCh/lab7IEMy+g5GA5el2v3VvEIuv9R45DOWynA1sKuuz1b37VqL58t/IV4RxFE64vX
	N3jwwWNt4AVja9Ha6JxJxz+UUbwu79aJT894LuPejHTLIoEJR27APt5KB2am4UZ/aWXMm6LURSE
	zOVPUl9pRoEp8vW4Si774q6/uOocHt+JlSJoWUcH7frXtp2r86oq4F75y7f27v5PA/ybEKAyLyc
	rLWd8eMXI7jcr15enKWiN0/Li3oM3hA/Ei4tKTJeSzxBtSSBbNHkQNcSLHVH/eQhYSlact8pRit
	K9GMmMysSRvbOu3qxzz/wJKyq84=
X-Received: by 2002:a05:6a20:dda8:b0:402:4f40:c761 with SMTP id adf61e73a8af0-4024f40c789mr8567537637.37.1795505371142;
        Mon, 23 Nov 2026 23:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm6519888a12.5.2026.11.23.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] Add SG2044 eFUSE driver
Date: Tue, 24 Nov 2026 15:29:20 +0800
Message-ID: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Change from v1:
- https://lore.kernel.org/all/20261014074516.240247-1-inochiama@gmail.com/
patch 1:
1. Remove clock-names minItems.
patch 2:
1. Fix wrong buffer size in sg2044_efuses_read().
2. Fix return type of sg2044_efuses_read_strip
3. Fix some style error on the driver.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   |  59 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 176 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.1

