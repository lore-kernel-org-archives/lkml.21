Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937447;
	b=4oAZSEuLFtA79IFWckgZhXecx9dWTsHELNKMJrf4yc3Vt1JITDituPY7K7jh/Y8xg4z7
	 +lXfi/D1YjiMJ8H0a9h+QOopSoZ/+W9OfC/xPyB7poHeNrXmei8Cp1WBRSFgPlPGb4OX4
	 Hkcb1KjHRUFmuGg0dsFCUBJHD2h9I1Xy7AbRvvCnf6SPMyP73rX2tJoRCbX5W7vVK5tMX
	 Gq5IwP36T9KbLifhL6xDkaBQrphy0QY8P4PyR05DV8DwHyWZzBhn7NxBpDtTEcUpYkmvv
	 B09OLlWMUTW/F9I3VDOHhV/OTCx/8RIhmrufu0+1Q5Bx+UfNa1qbzxi9uY94cMKsCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uKVN3cMMqKcQp/QJBvqNbe2qemW+gMKwHZ5x6CAtQXY=;
	b=k5uNbog+Qs6L0jGJ+LV6WCPqRfQiOc5VKpnIMUUwYq9zFe7E8ofeq/Pn6XmUQiwHDlt6
	 Fu75kmNQTLH5ymtE9xQiEGXlMwWu3r/w6LVFNRtLGK/MT/zFaTO9q94rFQ8S8YOkVxu3I
	 PjXPXpu2/7JslF8f+uwBEiA8A7E9NvWmWPxdOu7pbxZd1rPzM1ecISvOC469VcH6b5jd9
	 H9QoutNfZI+I0hMcHPkSZv9J5/khRenmiJ7VcN9kWf6YPOuuHY4LkYodfCBavRMXTQVKj
	 pmYnrZEN81JqCF6QWLHNh3sIzKdEMUhk8mdLiL+EVQe/beq5Uw0CNpCbib8V32EdsfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ighFqIIr;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13B606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB13B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ighFqIIr
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db89857abso3344757d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937446; x=1795542246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKVN3cMMqKcQp/QJBvqNbe2qemW+gMKwHZ5x6CAtQXY=;
        b=ighFqIIrqj8XgweqF+jcqTIipSiZQ1m5nuY32ut8uJCeuV5oKtiot4TR1GhQmkGZyL
         hM49wGPbrADnFOkwkjqKcmHsnLyMUX6qW6fVPCdkHk9W7BpXUSm/j5pO0PZb7c6gk2PJ
         qJj43RAYAQQMCTNuY2n2UlcuE+FzpbhFhjS3EHQm+zudzDsuZHSVBAkDIA94gbWOyxZI
         5PH33LStQkNsnVRW2lgPOxTqw/IomyPXdHgMI/GMq8vuZwigNT4bi24yRLJ9xx1glm8V
         jVSlm+XumCOW2XsVglP5w6c7u4yKkvXn4UTI/hbS58yqqw3hCWSvmaCngsStEadYJBIX
         uAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937446; x=1795542246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKVN3cMMqKcQp/QJBvqNbe2qemW+gMKwHZ5x6CAtQXY=;
        b=yFjaXFyQQpmODRzSh/RoO2dPH0VaunQ4eqiixPWkseyCTf/6mJmn0MO85QT5eBws3h
         HGvdldo+lBVfPa4oSNd3c24u34eXnXejYMF7jG//gAeqK3HAEBVqm9WB7u1hEj97ZIQe
         Z6GFr9iM62eRjt6KSTkyUtxQwglUxQE1RKLUz2AEeWHpz8v28BT/0G5UQRWGKIvof312
         gz8DTdEZPolrkk1em+RDGAVzGnRS2JkSib0sgzrE3Gfw40LKcfvfij0KLoG1+lgHHLeJ
         cRYxxUn8ckqUlRddxFPteYhtdVjxNcmrWPgDyhnKKfG/wbobjP+506Ywej4H5YofSgpQ
         a4rg==
X-Forwarded-Encrypted: i=1; AL+hErGzV2CxHdmuWj94VQTsvcpJy+vOVcQFZkSstNYm0MITg0MyI12sDsvRphLklVP7GP6y0MUWJYCxLc55tCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DQzJtwfv/Olvw01WeeRy73DqzeRQmSoCs5Eu9FyP2ybmnMeJ1
	/hXwrQaKDSL4f5rt7S8dpdRQN+em/+3O6bBRIkzKKdNa80aeEi6Gs0Wg7E3R65KeT+4=
X-Gm-Gg: AZFdTZdYzIfYPDUnFTE0w8XEG3pSZ9IJ8VyZv2usiuKgrW6C7eNkkViFaa3j15bdTF3
	pg218sTixdxfwoxTJoyqIafDJpnx9V8oQ/RGtGMupcipFSCXFKutLh7HapX3XO+Jai7fFRP7DOs
	xpJvl6Tr9DAkx8gkHZTTp3oZDf329Jx1T9Q2tlK0ijr8aTtegyFuoZeguW+SmrVmhMTOob1J8Bx
	fWosjh1VpyUkJFKN1EWgoYYP+MfRLtnx/kAOZiI8SOr5yYOu3QcyIrWHPVgERM7Fj9fQhP66BtO
	SFfa6tF5nGaDsM0BISnv7WiZhP5G+bFYfcOpMQTkYD2nAiPZ4/tnmt52jWe13ZTwWY6VnQYiOX9
	BWgKO4Z0ezLs/Ilx6WFBttLyaJNU9Vgd2PiAHzMDOTBKU6cFjtJlRBRvFQtkHfwkpuRI5+vQusb
	6sfEpc0JYI8fIq45WaCtLA3p+nhzAERv9PmRmRapfH6A4wmMPkREqdLvvdrpSjzyIlBTSDiBM3d
	Aw/VYOzs1NezShVn9lb4K+o4SFlOLyv8E/ls05TaoW/e5TfVoNO1oNNo/cGC50XzM9H3d5eNvQE
	5Yq/epL1SuqfXSoYej7LjZ1tUTlbzWsd7WYbAXCn3mkxQIWyYISjwD6vLQwNy0Qv4sFeJuTLurV
	B4Y4OT34oxvuZpBuOcj+vbVMBDy28n3sFWYbqwi5CSKSdZEvtSJ6N9tm7HmFlKlLxNZ96DA08bS
	NVxcO9r0f2HApsMXUTXA==
X-Received: by 2002:a05:690e:151b:b0:67d:c37d:331e with SMTP id 956f58d0204a3-67dd3fe9f53mr89877d50.119.1794937445825;
        Tue, 17 Nov 2026 09:44:05 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed5e0sm205158d50.5.2026.11.17.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:44:04 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:57 -0500
Subject: [PATCH v2 6/8] powerpc/perf: mpc7450: Export the event format in
 sysfs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-ppc32-perf-v2-6-2072e9b90009@gmail.com>
References: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
In-Reply-To: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>, Tanushree Shah <tshah@linux.ibm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+lEsdbEQj8rALkNtLr6OeVNtXuxnotW+z/AE7BFI7fU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIow3N16UvC5FRNL39GZdtxmbzjET2xz5U3g8q1fM
 vXtt2fTOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaahdEM/wtPtj3MO6
 Blxm/SKP0vU1B9+WuWyutW2drcW/dcW3fu+3yGv8JaW57+nbfc+vWxTPfwR66vOawkHCq456rPZ
 L0dvU69nw0A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The MPC7450 PMU has no format/ directory, so perf can take its events
only as raw codes, and cannot set the threshold by name.

Describe the fields of the event code: the PMC select (bits 0-6), the
PMC (bits 8-10), the threshold (bits 12-17) and the threshold multiplier
(bit 18).  A threshold event can then be written as, e.g.,
cpu/event=0x12b,thresh=20/.

Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index b2fe977cea16..9bed5c238f45 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -398,6 +398,31 @@ static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	},
 };
 
+PMU_FORMAT_ATTR(event,		"config:0-18");
+PMU_FORMAT_ATTR(pmcsel,		"config:0-6");
+PMU_FORMAT_ATTR(pmc,		"config:8-10");
+PMU_FORMAT_ATTR(thresh,		"config:12-17");
+PMU_FORMAT_ATTR(thresh_mult,	"config:18");
+
+static struct attribute *mpc7450_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	&format_attr_pmcsel.attr,
+	&format_attr_pmc.attr,
+	&format_attr_thresh.attr,
+	&format_attr_thresh_mult.attr,
+	NULL,
+};
+
+static const struct attribute_group mpc7450_pmu_format_group = {
+	.name = "format",
+	.attrs = mpc7450_pmu_format_attr,
+};
+
+static const struct attribute_group *mpc7450_pmu_attr_groups[] = {
+	&mpc7450_pmu_format_group,
+	NULL,
+};
+
 struct power_pmu mpc7450_pmu = {
 	.name			= "MPC7450 family",
 	.n_counter		= N_COUNTER,
@@ -411,6 +436,7 @@ struct power_pmu mpc7450_pmu = {
 	.n_generic		= ARRAY_SIZE(mpc7450_generic_events),
 	.generic_events		= mpc7450_generic_events,
 	.cache_events		= &mpc7450_cache_events,
+	.attr_groups		= mpc7450_pmu_attr_groups,
 };
 
 static int __init init_mpc7450_pmu(void)

-- 
2.56.1

