Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335538;
	b=fCmS+MKLoqa8Wwwu8ehgGDG7DKGlRv8OtqVfcLMcLyTRExeAG23S5ZM1eBPB6+LzHvxf
	 yOl2w0Vk6PmOBjD3WwltZkgnAmc8Rfzdr+GXmy7mRVwD/rurgI8NBhebDVzrXP2uG4yAL
	 F8YZ4W77qAr4GBRiH9e2LNqwQNeVZcQy84UERqt5OdmFqmcOHLoTgteXe5jV3ThLXZBOA
	 0DORPHgz5BwWyh1GFeT5TugJDgaB1X4wpCQmXBMFutbJgnB0AND1zoOcn5Jwut2V0v2OQ
	 rFLMLgf5azeX4yVv0K6ihn0Gns16CznROwOZ8lccE4fCJMfvIwDkMH9a2QlF5ym60jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
	b=ECN/av1cz3YDFqa5NGobOSZ4ad/jznri22hMtHmKe1BalG3FyVHtE4tskdDQQGNWx64G
	 H6U5M+6ZybjO7BjEkmfZd+U8k43nf7g+tzDu7wEF1EevqffuVB7xQ/vp9jPcrqz9oxGUq
	 c7nmmr2CuuAakecgRsLsYuxVuVMxTR4ToNjhM8aEs58/MoZI0s7if8Ma4Be06GnLDaxtO
	 7nO8FqY16JCzedr92OhR8pYX7BNQ8HhUboCsUjoR/6D8xv8ehDmAcMToEYNvh1zthjw6m
	 A41/wLJG+PcKcq6qtjjaxfkN0RNTZeWyVPQHXbSVUsK3+Ls4JgcyCh7LtZ/POeETP5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3gy01qA;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B80606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B80606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3gy01qA
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3459280a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335536; x=1795940336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=b3gy01qAMNQg+E5iRsZZEbs3wyCgdjFYoytE433N125hdIDoIbmptbh3zROT4vXgF7
         UefW+fo1JRHTOohAvnIvVwbKCseuSJWSsab4CvYOXFNJQlhV7B8YpaUuPQo6C00WNusf
         w31SDWc5ajeXV17YAkN8VUKvDvUv4NoH5Y5AfRWckMp6JWj8TqYvaoVL/ijbIDOX5+Fs
         Cu0HBpsz1BI7H78fVTj6Q0NCBR7TKaSB+DC1ciuWhjVNylf6PISk9RXHVlcFMk1yyQ4c
         aO8fA60woAbKo0ptM/1HKG7YyZuynEFDMKC63XO1AmwFR2E+y5qtaag4wIsnBZSqm9TU
         Hiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335536; x=1795940336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=DevmQDsBjYvq+jvxlgqnjmtgvjhEzDp7g7eY2qoZMI7CJLl73hG5Mq2nakVhDfEwcF
         f/kQvTt4znHT+eU4FBS7ueS7Lc3V+Tu/PeOU9JrZ0wZNcSiuKqcLMElswKrTubVz0r2r
         l3YwnsT4Cho8IO73qP0bX6M4/tT+erdc561UAn/LeRv7lAjvMMHS4ld64K5QgHURQTgV
         wr/oTjW6HpH8sSY69XzPkKWx3g5iFfBy1BvDjbrS9yH+ao/7fHkujnr4TPueVZ505I/Z
         Opb7Oq35LnjaNzprwal61jR9BUSLiIqcoEU4UyCuFHFMamBzguSDTPv7zEgwiTJ85Fp8
         ZDMg==
X-Forwarded-Encrypted: i=1; AL+hErGDSp8GiSTDVZGYwI+2lsjX3Vy418Hb/UVkgywk4cIcoxdbDOx8MuLucH8I5dgYdGwrdd7Eg4RTJ+JL6FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bkMqnlX1nMfOHNRYRnu4P2rZjbLuDB26lqx3BdsPpNkKUE7aA
	Tw8Z/NgUuwfqUG+6QG6EgDh193SDbgi9/fcY6FB1FVQ2CogtWV51PW5m
X-Gm-Gg: AZFdTZfVbHvO822mbSCJdigh56Tq7pvyLJYERDv5c3VKr92apCClmVQN0yS4rg0DuFK
	jJPc84nNO07R6rjMmAlJ6hu3NpDzb4hirog+piXGFVF4iZC1VzIWibPUqCbNr3fBY6mAQqjHc4h
	B3Fl+I5yyZQv5JkhcBb8W86iCUiNzNw+h3Wt8cOHLeLovdY0kXEKTuvJ8EV5r3IfNdH7dZlICeL
	kxhdIaW/cmVVoiaOFU7JwJSOAkH6HzyeBrWNrqoECW0ucg4R8/o45MAmyeTygvwTx6Wzu3o88h3
	+i2DIxrNlXwRzXgx6sb5D/aNtH186M02bbTwHTRvwUk8d1yr7eHeI7CH5fpbctFh0rHWEHCs3R2
	nmNB89hc6XwZEKC1l+Gr5Wx9Owt7UmWXr44ipZp6TuGlKI42YSf90WPbIpnHK9Rd58oMtckX01n
	sU4ZwGahWyYTxpj1Psn0ErioNEWkLibjgxXZz6xCrhR/THndMTFKX6gzDz68Kg4C2evmmAgcOTF
	z2peDPojKt4MgDS4qeROxzBBR9Rh89eRu+yPsJgtw6T3DIEO5Ud7lbNmGjXg3PtzuTTXKwWOQXP
	+Q4lrpd8kIFiwX/nN1tRKGXiqvY9BryBePTR3BgEi8rklguPpW3knJ2Q1wDGXrGCOq4PUw9dEhB
	CVT7LCBa9aIk=
X-Received: by 2002:aa7:d404:0:b0:6ba:1266:cd94 with SMTP id 4fb4d7f45d1cf-6ba37e89ce2mr4304301a12.39.1795335535882;
        Sun, 22 Nov 2026 00:18:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/12] drm/tegra: dc: Add elements required by Tegra MIPI DBI
Date: Sun, 22 Nov 2026 10:18:14 +0200
Message-ID: <20261122081820.53199-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Add DC register definitions with additional fields in preparation for
adding the 8-bit CPU interface (MIPI DBI).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.h | 194 ++++++++++++++++++++++++++++++++++---
 1 file changed, 183 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..e8913c5530a2d 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -272,14 +272,150 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  DC_COM_CRC_CONTROL_WAIT (1 << 1)
 #define  DC_COM_CRC_CONTROL_ENABLE (1 << 0)
 #define DC_COM_CRC_CHECKSUM			0x301
-#define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
-#define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
-#define LVS_OUTPUT_POLARITY_LOW (1 << 28)
-#define LHS_OUTPUT_POLARITY_LOW (1 << 30)
-#define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
-#define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
-#define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
-#define DC_COM_PIN_OUTPUT_SELECT(x) (0x314 + (x))
+
+#define DC_COM_PIN_OUTPUT_ENABLE(x)		(0x302 + (x))
+#define DC_COM_PIN_OUTPUT_POLARITY(x)		(0x306 + (x))
+#define LVS_OUTPUT_POLARITY_LOW			BIT(28)
+#define LHS_OUTPUT_POLARITY_LOW			BIT(30)
+#define DC_COM_PIN_OUTPUT_DATA(x)		(0x30a + (x))
+/* Pin unmask is 1 bit above position of the pin in the OUTPUT_DATA register */
+#define PIN_UNMASK(x)				BIT((x) + 1)
+#define DC_COM_PIN_INPUT_ENABLE(x)		(0x30e + (x))
+
+/*
+ * The definitions below describe pin positions in the DC_COM_PIN_OUTPUT_ENABLE(x),
+ * DC_COM_PIN_OUTPUT_POLARITY(x), DC_COM_PIN_OUTPUT_DATA(x), and
+ * DC_COM_PIN_INPUT_ENABLE(x) registers. The comment before each group indicates
+ * the index of the register (the x value).
+ */
+
+/* 0 */
+#define PIN_LD0					0
+#define PIN_LD1					2
+#define PIN_LD2					4
+#define PIN_LD3					6
+#define PIN_LD4					8
+#define PIN_LD5					10
+#define PIN_LD6					12
+#define PIN_LD7					14
+#define PIN_LD8					16
+#define PIN_LD9					18
+#define PIN_LD10				20
+#define PIN_LD11				22
+#define PIN_LD12				24
+#define PIN_LD13				26
+#define PIN_LD14				28
+#define PIN_LD15				30
+
+/* 1 */
+#define PIN_LD16				0
+#define PIN_LD17				2
+#define PIN_LPW0				16
+#define PIN_LPW1				18
+#define PIN_LPW2				20
+#define PIN_LSC0				24
+#define PIN_LSC1				26
+#define PIN_LVS					28
+#define PIN_LHS					30
+
+/* 2 */
+#define PIN_LHP0				0
+#define PIN_LHP1				2
+#define PIN_LHP2				4
+#define PIN_LVP0				8
+#define PIN_LVP1				10
+#define PIN_LM0					16
+#define PIN_LM1					18
+#define PIN_LDI					20
+#define PIN_LPP					22
+
+/* 3 */
+#define PIN_LSCK				0
+#define PIN_LSDA				2
+#define PIN_LCSN				4
+#define PIN_LDC					6
+#define PIN_LSPI				8
+#define PIN_LSDI				10
+
+#define DC_COM_PIN_INPUT_DATA(x)		(0x312 + (x))
+
+/*
+ * DC_COM_PIN_OUTPUT_SELECT(x) is a set of 7 registers that allow selecting
+ * one of 7 functions for each pin using 3 bits. Clearing all bits sets
+ * the pin to its primary function, while setting them to 1 configures it
+ * as a GPIO output. Other functions are unique to each pin. For details,
+ * check "23.7.17 DC_COM_PIN_OUTPUT_SELECT0_0" in the Tegra30 TRM.
+ */
+#define DC_COM_PIN_OUTPUT_SELECT(x)		(0x314 + (x))
+#define PIN_OUTPUT_SELECT_MASK(x)		(0x7 << (x))
+#define PIN_OUTPUT_SELECT_PRIM(x)		(0 << (x))
+#define PIN_OUTPUT_SELECT_OUT(x)		(1 << (x))
+#define PIN_OUTPUT_SELECT_F2(x)			(2 << (x))
+#define PIN_OUTPUT_SELECT_F3(x)			(3 << (x))
+#define PIN_OUTPUT_SELECT_F4(x)			(4 << (x))
+#define PIN_OUTPUT_SELECT_F5(x)			(5 << (x))
+#define PIN_OUTPUT_SELECT_F6(x)			(6 << (x))
+#define PIN_OUTPUT_SELECT_F7(x)			(7 << (x))
+
+/*
+ * The definitions below describe pin offset in the DC_COM_PIN_OUTPUT_SELECT(x)
+ * registers. The comment before each group indicates the index of the register
+ * (the x value).
+ */
+
+/* 0 */
+#define PIN_OUTPUT_SELECT_LD0			0
+#define PIN_OUTPUT_SELECT_LD1			4
+#define PIN_OUTPUT_SELECT_LD2			8
+#define PIN_OUTPUT_SELECT_LD3			12
+#define PIN_OUTPUT_SELECT_LD4			16
+#define PIN_OUTPUT_SELECT_LD5			20
+#define PIN_OUTPUT_SELECT_LD6			24
+#define PIN_OUTPUT_SELECT_LD7			28
+
+/* 1 */
+#define PIN_OUTPUT_SELECT_LD8			0
+#define PIN_OUTPUT_SELECT_LD9			4
+#define PIN_OUTPUT_SELECT_LD10			8
+#define PIN_OUTPUT_SELECT_LD11			12
+#define PIN_OUTPUT_SELECT_LD12			16
+#define PIN_OUTPUT_SELECT_LD13			20
+#define PIN_OUTPUT_SELECT_LD14			24
+#define PIN_OUTPUT_SELECT_LD15			28
+
+/* 2 */
+#define PIN_OUTPUT_SELECT_LD16			0
+#define PIN_OUTPUT_SELECT_LD17			4
+
+/* 3 */
+#define PIN_OUTPUT_SELECT_LPW0			0
+#define PIN_OUTPUT_SELECT_LPW1			4
+#define PIN_OUTPUT_SELECT_LPW2			8
+#define PIN_OUTPUT_SELECT_LSC0			16
+#define PIN_OUTPUT_SELECT_LSC1			20
+#define PIN_OUTPUT_SELECT_LVS			24
+#define PIN_OUTPUT_SELECT_LHS			28
+
+/* 4 */
+#define PIN_OUTPUT_SELECT_LHP0			0
+#define PIN_OUTPUT_SELECT_LHP1			4
+#define PIN_OUTPUT_SELECT_LHP2			8
+#define PIN_OUTPUT_SELECT_LVP0			16
+#define PIN_OUTPUT_SELECT_LVP1			20
+
+/* 5 */
+#define PIN_OUTPUT_SELECT_LM0			0
+#define PIN_OUTPUT_SELECT_LM1			4
+#define PIN_OUTPUT_SELECT_LDI			8
+#define PIN_OUTPUT_SELECT_LPP			12
+
+/* 6 */
+#define PIN_OUTPUT_SELECT_LSCK			0
+#define PIN_OUTPUT_SELECT_LSDA			4
+#define PIN_OUTPUT_SELECT_LCSN			8
+#define PIN_OUTPUT_SELECT_LDC			12
+#define PIN_OUTPUT_SELECT_LSPI			16
+#define PIN_OUTPUT_SELECT_LSDI			20
 
 #define DC_COM_PIN_MISC_CONTROL			0x31b
 #define DC_COM_PIN_PM0_CONTROL			0x31c
@@ -303,9 +439,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -456,6 +598,22 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
 #define  SC1_H_QUALIFIER_NONE	(1 << 16)
 #define  SC0_H_QUALIFIER_NONE	(1 <<  0)
+#define  SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define  SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define  SC_H_QUALIFIER_DISABLE			0
+#define  SC_H_QUALIFIER_NONE			1
+#define  SC_H_QUALIFIER_HACTIVE			2
+#define  SC_H_QUALIFIER_EXT_HACTIVE		3
+#define  SC_H_QUALIFIER_HPULSE			4
+#define  SC_H_QUALIFIER_EXT_HPULSE		5
+#define  SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define  SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define  SC_V_QUALIFIER_NONE			0
+#define  SC_V_QUALIFIER_RSVD			1
+#define  SC_V_QUALIFIER_VACTIVE			2
+#define  SC_V_QUALIFIER_EXT_VACTIVE		3
+#define  SC_V_QUALIFIER_VPULSE			4
+#define  SC_V_QUALIFIER_EXT_VPULSE		5
 
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
@@ -493,6 +651,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

