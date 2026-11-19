Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081668;
	b=ziq+XxU6vROQ248IK98V9/g7kBxVlQJ18u8XXM4ofZauSWy8SjpVE2TsnytYxBVaPU6c
	 sJfAL22ax+9RGKiRRBvTgmguunI3287qS8SIvAKDARiZQxSzHpcfEBInB4otUJrf6enHz
	 OKeC/dihSy6iC4VdwBU8EohopfpRRh5PhIgy0E8a0QrD4xQdl+tXDc8NZzViECyy1rAaL
	 IBb6v9bOl0B1UuDXSKiOoji3KFYeSTNxI5mmNjGcJvUQ0bl+mX93fTqBfoXdI61cIK/Fr
	 RbRegT0u3ApY71DLtMDF5jdyaLqkuNz7mC1egZ6TCr1JlmXahkWiysstl1iiL1It2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nDmOaGksnQ0ZaNPhnJ/CN/aXZ7Trn/wxpPpsg320EoE=;
	b=sqd14oPvcKjPMHJJZJs7Zbj+9UPeVHVmQ3Veic3ycSsjH4AcrXybyttspzX/icmaek35
	 /x9kfYpSp46vPh6QOlQgyN5rjv/1c08j4iH79J4zV0y6RtbCdtqffoCl0GkEv4y0xRoRH
	 KoZ+yM4jev+OK/6KuuVFfq7LxNnAHqzeCAfzDEkfVNwGfgkAKR+dGbTKUAVjjr9kAYPBJ
	 XMXXLL4KXncJEH1qQOitZ0IAGhArIi9HQ6VrQ+l3xmndX6KL51YBlqKtHamSX93AjTmqw
	 hTNgmxGhRl42CmcvlkJSJIWiescHffuH0il+ogCuDjppSNblpHTWHMtlBmfcHv64fqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grSrW2LC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8HEA365;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C360A380A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514C360A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grSrW2LC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8HEA365
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vEWF2935558
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nDmOaGksnQ0
	ZaNPhnJ/CN/aXZ7Trn/wxpPpsg320EoE=; b=grSrW2LCeH3tmw9LSckOF8dcZ2I
	akabmrWgyHZSLF4ErBjqq4havvctuRmcuceDZBvvAPT7CS3YEomvPJRrJ04NbKhC
	ZF6Ukv2a0MZq2UWQaLiRgNy2cDKh3f9gLxUPznlqjS6qwtjkpt93YMDZ3F/6ReSQ
	f+awubHpr75Okd68rxH7jHDtaH20QZunPs1xBx1ND7rNDxzEy+oM73DzEMO5M6Wj
	0X4lqW/r/2OM9xEnk1XbVJcpqxvQY9fikPedW0UBvm4MIaf2lJkUy/UYk7jP1sGW
	D5dZznxuJkHHL3oT/WEiFfNZXMrPmCfLvEdgquaCAPuQNwGFaP0A9/MD2kA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekrqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so143781385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081667; x=1795686467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDmOaGksnQ0ZaNPhnJ/CN/aXZ7Trn/wxpPpsg320EoE=;
        b=D8HEA365JxjC+VThToO0huizG+Ps9jEaGAXAHCg9XyZoTph6nNhkwW63aMIh9W8SjN
         QY+iCsCxhfi1J7zS0LNEBOYoiaZoLsuRagzPHeMOC+zr/aOIwYKeKsnmapGatGX1LBFR
         LfJqAiKePzaf1RkohVaARzg/jddrT0cfzGExZ8sunkjO9ylqmdaqccX2gLFP0/+ySqad
         Te31BDQWwKcniOht56v1dJyV096wZgvQwh2u88BjbB7CEJhYLcjWm9BNyrw9xuv/IGjx
         yiUfnyhboS7T/j9mqeJlnquZiIwqH9kUdChbgJDefqpZXAPwD32DgPIrrRNbj6yaku+u
         iVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081667; x=1795686467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDmOaGksnQ0ZaNPhnJ/CN/aXZ7Trn/wxpPpsg320EoE=;
        b=Tm+4/GviY7YzHcXsMiecmEcyFblzCELIYCF+BwS/RZp9+1O6dBchPzGYY50m9oKiXr
         irfl5BIsWC+Kq/WJCRo/7PHvVlr05Sthi2VTs1ITRgerDbTHdQfS+uGlLBYQCAfz/DuW
         drqE3FMZM28bS4Q7pP+hGaLMwhU0ucShaTsOButGEIsP4B2+0URCpmG37mxwjVhPYBfR
         xrM24+IzHsPjVoxyQeq2k4PT0AXFpLePGhLwfWKrN7kF21qJdhUCKlqnijpjZu2Rkbrv
         eevGP6dLHytq4FKkoK1zHzEvRhRMxmpYwceVFNsjjZ6uK8rt+gHteR0vkv7ASgfjCHjj
         pHrA==
X-Forwarded-Encrypted: i=1; AL+hErGwnMkX31lsZZyeBvIfWl2n82DFce1AJT2EClXDEB646pjNXN1aq536InCnALkcOt5fdexdqU4Pm4S4ZVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yuus5n3PkNYNZwe9kXm0j8jseXi6RQpY593xTFS/Q3tX7cBzT
	phtm2vaajkYZ5UXn8Z1JzpHiSv5WeSS/IDTfSLs9T+8Rv0Y0mHTk4BYvmjBUj2F6sq70mmyFgDX
	Ygnc1dd2k+FbFoL/Jj63I/H1MyvkhssfWg32yKAqV7T3nWQ7AyYneGzcTWNrlaEt63SE=
X-Gm-Gg: AYBFou11HH4WpVnrd/jlfflO6zADWmfrlxGg2/c7uQLlqZUts8hVzNrrhbttVZO81IR
	QWtjkKeI+6YfR5QesQtVcRiggY5syMmHjFErUtATlXVyvBK+2rKB1YKR2bw3lRzINE3pW4gTfhP
	hpaFnhn7XbOHdod3v8ayA87udfDYpLUmk/2UF6G6IlVxHwgixHFPfC/dw/GH9cDTWVpbOsYzORh
	CTZHeQyYh70gi9jDswuUQp522Dul69wA3OChJx0URcnSSkVlVXvAY1fceaDk+I0B+BbIRQQLtf1
	0uNnv3vaH8glCJbUIfgNzW8IoJxQZPDIaP5/oKaZJd74Kke1bZRP57qTpIXC7AkN+R3jtRTYHLP
	VoBQqkYxGJWd+5PfGJZhb0Av3xpW/oD7LQ6Hq/mLF6jxes01xE3am1Zyhxy2sBTYXJ82N1UZy+j
	2j
X-Received: by 2002:a05:620a:1d02:b0:949:6614:667c with SMTP id af79cd13be357-949b3572259mr75038785a.11.1795081666641;
        Thu, 19 Nov 2026 01:47:46 -0800 (PST)
X-Received: by 2002:a05:620a:1d02:b0:949:6614:667c with SMTP id af79cd13be357-949b3572259mr75035785a.11.1795081666069;
        Thu, 19 Nov 2026 01:47:46 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:45 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 09/12] thermal: of: Track registered hardware temperature sources
Date: Thu, 19 Nov 2026 10:46:51 +0100
Message-ID: <20261119094706.3439040-10-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX5ALbqmpScP77
 L0XtDbVBR/EQyMAmd8AWzrWc3Nmg5Ch5OI6RvlhVwUNX97yTcRujJjHJaPds/vRnlbVyB/BTd9f
 O+ULfis34sptx3Ltvvw1qPr4qLw/fiEpK+d4RTTUZTYnhp7KEa/an1Fh2ktucGBPo112tntdQ7K
 DsJ9xEN6zd0Y6y0L2S0WOJkGwIEhXWpF4ipKh8GwvIhgk+sSuY5ooa5JXlauOuO3ySxiMgcCoD/
 qCK9TPLdQIBTgJgvG2iIf5Pzl9heQ/fMJYNLGTtc4klTbLKEv+DwNMrq0ZOS603TagoHNAowNFG
 rRxQQyE7PRyR4tVjYwxTgVETi/he1kLM+o05jk1s7ROEdSL6vG2CyH/cLg6S5kdwb070foMVfuI
 nc690hQqUrTD4/BurfyagheW0l9Z9R61EjxZpnQkFWnQIPpbw7v5CwKWwcsmwafP3RToSBH2t2u
 zIsDgefsi47pihy9+dA==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afec5c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=wuaHHyd7DoH6fRT8h70A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NPzJhXIrgTLNxavZNTO6aKnTcSY-V4y3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX2l17hX2Oj7fS
 U/JB5tPsJ+ULpotTejsPrX2DGX7Je/jyMBH0MYT4u7zxVqvn/GF0di1/58Gw5fkfs+bn4AceH/Q
 9qXaaMc7aZQQzlODebysci1heihxWPg=
X-Proofpoint-GUID: NPzJhXIrgTLNxavZNTO6aKnTcSY-V4y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Record successfully enabled OF source zones by provider node and sensor
specifier ID. Serialize source publication and removal with an OF-private
lifecycle mutex and retain the provider node while its mapping exists.

Reject ambiguous duplicate provider and ID mappings. Remove the mapping
before unregistering the hardware zone, providing an ownership boundary
for subsequent OF aggregate consumers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 710ff25140e7..1fa7e29f5bc8 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -18,6 +18,75 @@
 
 #include "thermal_core.h"
 
+#ifdef CONFIG_THERMAL_AGGREGATION
+struct thermal_of_source {
+	struct list_head node;
+	struct device_node *provider;
+	int id;
+	/*
+	 * Borrowed from the OF zone registration. The mapping is removed under
+	 * thermal_of_lock before the zone is unregistered. Aggregate consumers
+	 * acquire their own references while holding the same lock.
+	 */
+	struct thermal_zone_device *tz;
+};
+
+/*
+ * OF lifecycle operations are serialized outside thermal zone locks. Thermal
+ * callbacks must not acquire this mutex. Source removal holds it until all OF
+ * consumers have released their references, before calling core unregister.
+ */
+static DEFINE_MUTEX(thermal_of_lock);
+static LIST_HEAD(thermal_of_sources);
+
+static int thermal_of_source_add(struct device_node *provider, int id,
+				 struct thermal_zone_device *tz)
+{
+	struct thermal_of_source *source, *pos;
+
+	source = kzalloc_obj(*source);
+	if (!source)
+		return -ENOMEM;
+
+	guard(mutex)(&thermal_of_lock);
+	list_for_each_entry(pos, &thermal_of_sources, node) {
+		if (pos->provider == provider && pos->id == id) {
+			kfree(source);
+			return -EEXIST;
+		}
+	}
+	source->provider = of_node_get(provider);
+	source->id = id;
+	source->tz = tz;
+	list_add_tail(&source->node, &thermal_of_sources);
+	return 0;
+}
+
+static void thermal_of_source_remove(struct thermal_zone_device *tz)
+{
+	struct thermal_of_source *source;
+
+	guard(mutex)(&thermal_of_lock);
+	list_for_each_entry(source, &thermal_of_sources, node) {
+		if (source->tz != tz)
+			continue;
+		list_del(&source->node);
+		of_node_put(source->provider);
+		kfree(source);
+		break;
+	}
+}
+
+#else
+static int thermal_of_source_add(struct device_node *provider, int id,
+				 struct thermal_zone_device *tz)
+{
+	return 0;
+}
+
+static void thermal_of_source_remove(struct thermal_zone_device *tz) {}
+#endif
+
 /***   functions parsing device tree nodes   ***/
 
 /*
@@ -359,6 +428,7 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
  */
 static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
 {
+	thermal_of_source_remove(tz);
 	thermal_zone_device_disable(tz);
 	thermal_zone_device_unregister(tz);
 }
@@ -446,6 +516,15 @@ thermal_of_zone_register(struct device_node *sensor, int id, void *data,
 	tz = thermal_of_zone_register_node(np, data, ops, &tzp);
 	of_node_put(np);
 
+	if (!IS_ERR(tz)) {
+		int ret = thermal_of_source_add(sensor, id, tz);
+
+		if (ret) {
+			thermal_of_zone_unregister(tz);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return tz;
 }
 
-- 
2.43.0

