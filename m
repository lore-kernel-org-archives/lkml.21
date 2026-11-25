Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631852;
	b=QCpV0gQfMaPjpXKJZ6I3wLfQU9a4QrYH95MWGZqrRBBFzUE0i7hRnbe48NzYMghjrbJ5
	 ycM7w2+2eRdF3YeFSxVsF/a3y+MywhG4NHZDImtoohkvr32SPXFP5ZyHTJjp35V8rdPGE
	 7cVRyj1ISigrV52/0c7y3oDmb1Y6QlJR9/h2dRfv1ncJBr/JpdoX8wZ1OgCBER/lLqppK
	 aDyyVf9f1f4m9jLGraNjCMSpzGspxsjS4dwqpvlBcHnhEvk2kbUNUfGuuG2+lUIgizqpX
	 j52PvxP5V4pGpaBFdJWdITIgrDMk21YGkAZd9JYP0oKuy0YczsQ9y+cB1STiKF8ntjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
	b=JBao3+A8NrIyqB8a/TYjIFo3K1LyFpPi99n74+2N1+2nKJFquyrVonGXMs0m51+C9ZbY
	 G9P4BRCjiu+FnNN3PbeGeNlAEo7vlHokNrEYseGaJWnFAYpkSeao29I5jp3GXiL2TtRpg
	 i7+x6w9E74TGY2v8OT1tBShZ2w+q+piabugF39ilRHPyNwt0/aSTU9sVDtPcLp5hrk/Yd
	 SQeWTnqo1QNUcja0ICMlNSNc/nDyO0Kul+lOC6CUqD/8MDnpH7TF7lxmHCQdSP4tbNKGV
	 cclKMpDpLSnFEypgbWiiUOEVvjkjgNZuXAky09n5Ye6L4JeWF8jD648QdOCjsJjpFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwaW9uHL;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF7B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwaW9uHL
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso33337465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631850; x=1796236650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
        b=NwaW9uHLhWDz1JQvFv1IoKf+QK7th0438JBfB6b5Jik8GN/zO/xJ+nEvvKuNrdtrqB
         RR6nofnnAOr3IgswVFRX0rEgBLgBnqxI/a5U4xKLHH7LfsWuZk6249L1jexDWFmgeeLc
         ytBbeYkm70OAs7Hbq5eQdFf1hQibJCo4+fEZQyMzb4/QbUIcv1UXeteUdyC4NitCbFIM
         BNj1P/OGAsAriCzgyyTLGSn1Ghaft1uiBmomA5hwUZDED0+gkuaVcwQcmpBmyCyts7gR
         CU8EocwDmH/8a5D5qne1KevXtlJ9uQim6yjDMNCm7cHUxVTtoWcaEmfg2EvAS2aS00Wp
         KhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631850; x=1796236650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
        b=pLxTyXBSbPHMlPwttDCcZ8PU2wZMJCQo9MYc6CVfvdnI1XjOxxgArk8dZnrRuXqotL
         dWyACi3gn+opNwxdVXi5+mN7D+wDPdHsPI0SM3pF4Wq5H+HajUs1GeQjV3hrFcOO4YIB
         5GbsTCq3LAXFhQKCjYkvCujuReLXQctEwX47chaeCsCWdtMRw8qPR8j1kzjdlOsIWcNM
         fBQJh2H0mor7KLGgsLoQAhdtRlWMUtZidVVyPFTLrzaPL+nSUYkfIQ+RG6ayky0dq0t5
         2x1CyB4Z1POEI9/tMdo3pMIloqa3T5VC6ffMX+PmMhwbrpnWmbdyJD6Ftt4PEaN1g9/w
         OP7g==
X-Forwarded-Encrypted: i=1; AL+hErG5iWkMDW5n1W0HqFgR1ebV9W+j7ojAlFas0rYaWZqTu56MjdgSbyvuzi6BVXQ0BrEIMhVjZZ/v3Fv+k4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OBlOijbu8xOkPtzVO4L0L/H2Mg0WE0LTd0/pUHlTMZdThLbDM
	etpUJeRp8kA1QOTvkYjlTAR9X2IVuGMPMzkQxk/JBRr1V4dv/H+U1UYKpctLZorU
X-Gm-Gg: AZFdTZfzJapRfK3Ynq3dziFCOhWy3fBA90oFwmAvJasL3YCc25hXnM5bIU6Kz8eZii9
	dJY1NXf3+KA2ZmnOyYDn0ENfzmsG92FgeSppOFI9LH0x/0j8cCOwQ5iTC8XkNihUwHabJkj6OXF
	SMCq3GktHW2Tmx68U54jtg6OJgSzWeFLvkHhIOVUE3Cs3vSGxAGSjABtTGe0YJRlMU0U/sYlrVj
	y4PXQ5y6i8TYAltusBYRTTA0dCaUM7uEQep67X3IiGZEUweDQ36BZo86SGEuRnTK1boVT4UG0Cc
	iAX/pkREkYovH1183Uw6AhPIYu7gGpWvCHBCm2fMyuPFsIHTMpY3j0n+tHPztOlkoMSfMEQME4o
	0LMsXfusrdYhTGDSAoreatoPf3K4It/79QI5OYqtnX9RMkYebLBqD1D4utDvnUZbt9htMQUU8LA
	Z+OoWbzCPMbkJciJqUWmqdHCGmYarWGYq9zPsNrA1t5YJ/AlhXlSB10sytAsldboR21Qwj6PhKG
	wxztU/E4lGBF9AV1b9lKFqH2YNVT+w9YB7IT+glNdp4XLsXVC1zobnVPL/ot8PnVWcc/8eDq8TO
	sOKT2PO0/QPIrITycDhYJHtBcP2aLcL+syUvmMc8NJjqxHhwf8+GEKHQaRSNdEQBEYBB/a7D0qs
	MKQ==
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr384863025e9.26.1795631850007;
        Wed, 25 Nov 2026 10:37:30 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm68397895e9.3.2026.11.25.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:29 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with SND_INTEL_DSP_CONFIG=m
Date: Wed, 25 Nov 2026 19:37:06 +0100
Message-ID: <20261125183706.53331-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi everyone,

Just to bring this to your attention.

snd-sof can be built into vmlinux while the Intel NHLT code that
ipc4-topology.c calls is in a module, and then the link fails:

  ipc4-topology.c:(.text+0x22bc): undefined reference to
    `intel_nhlt_get_endpoint_blob'
  ipc4-topology.c:(.text+0x2424): undefined reference to
    `intel_nhlt_ssp_device_type'

This happens with a non-Intel SOF platform built in and the Intel option
modular, for example SND_SOC_SOF_IMX_COMMON=y selecting SND_SOC_SOF while
SND_SOC_SOF_INTEL_COMMON=m selects SND_INTEL_DSP_CONFIG=m.

The existing guard cannot prevent it.  intel-nhlt.o is shipped by
SND_INTEL_DSP_CONFIG, but the guard tests SND_INTEL_NHLT, a bool that
SND_INTEL_DSP_CONFIG selects "if ACPI", and a select from an m-valued
symbol sets a bool to y.  So SND_INTEL_NHLT is y whenever the provider is
y or m, and the condition can only tell "NHLT present somewhere" from
"absent", never built-in from modular.  The static inline fallbacks in
include/sound/intel-nhlt.h are keyed on the same condition and are
therefore unreachable too.

Test reachability of the option that actually ships the code instead.  No
header change is needed: the file already stubs
snd_sof_get_nhlt_endpoint_data() in its own #else branch, and wherever
IS_REACHABLE is true with ACPI=y, SND_INTEL_NHLT is y as well, so the real
declarations are in scope.

This is the same remedy as commit 8a3fea95fab1 ("ASoC: SOF:
SND_INTEL_DSP_CONFIG dependency") applied for snd_intel_dsp_driver_probe in
sof-pci-dev.c, which commit 194fe0fc3422 ("ASoC: SOF: pci: move DSP_CONFIG
use to platform-specific drivers") later resolved by moving that call to
Intel-specific code.  Moving these calls likewise would be the complete
fix so this is the one-line one.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: aa84ffb72158 ("ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's")
Link: https://lore.kernel.org/r/20261107114944.561731-1-jude.gyimah87@gmail.com
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 22c15fbb93f2..3ad27c57564b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1790,7 +1790,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	}
 }
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
+#if IS_ENABLED(CONFIG_ACPI) && IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)
 static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 					int *sample_rate, int *channel_count, int *bit_depth)
 {
-- 
2.43.0

