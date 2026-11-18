Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018236;
	b=NnzSSZN3IAKAEqfqDH+RuTBuOTvvlUWMuZyC2pYZwFJ7OYPWtJECcNm4KeHRBKNL8bcy
	 kN1sbYuEfKWa63tXZWNYnPcprapRDJwVd4klNxfp59Q5Z1pFmM0Q3snPPn2lMXMxFJt23
	 6YH/1YPCSSI0pA878yj1CeDbfSZ+bBXj/tMjk6IZECb1rTfhpSsYKWf8jt0xBwfG3ERRc
	 w+pFj2Y0ap/+poiLlQWCpdEDUrzjW1hP+6Iv4OvWEd+xmKJZFDX6LZ2+XH1YKLFYB9Kq3
	 H/wa4v9sErSF4A2RGXVnHDgrBjUh+yTfcbb2jP2/H8S8uYjs9aQNXU5q3pK8braFjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6DyjFwh0daqRWVGV8alAfLhW51+EbUV4ESRE/kWsbJw=;
	b=igZxq8HL3WqK+K+Louyg2NCF0FHbNTEpRVYeKmUSe+5TXrLYUKq5yMOojeDMHxJQ7F6y
	 uAgsPbJoWUcLzbPhcDqm4D00nxkedJKr5B2WoAWsjeLWTmczcxCylh3v+jPfb7NXvm1kD
	 CI7sGvXqEImQrOKkNWQYYupcc/yPYzBplppOyarPcR5M0X3GlR2UgPpwcT3uKIv2Z5q4u
	 YIYlyJ2MsxYxVWMt3kzDBK2guMg0BUCUVdKAkYWFi2OTX4rcjoefVJnTZqRE9iZ+vmP/v
	 g8tUYseVW+6DTAc8SqqLcO86oTvOaxbSZ8Q7gVUy+i0LRcJpobw1/DYdTIjhWPlfjbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiZ7EFEq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idfRJWM7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D41606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D41606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiZ7EFEq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idfRJWM7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEIE781431842
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6DyjFwh0daqRWVGV8alAfLhW51+EbUV4ESR
	E/kWsbJw=; b=LiZ7EFEqfkvy0Nv+KTC5X1Hlg1C5MuL0h1McdBJnli2Y0LcnthZ
	bnBOCzt2Md1WNrt5PsxTVvm0jw0C6aDUZvsOmM2uXA6HiO3DGGAcXUqFFpD0jWS1
	YdwflRKmpbYf4ljA/MfyE9aip9GN1XJCpJyGn4x4s9/b3jCvWdd6GPcJc/SUunHt
	XEVokqUpyPX8U3gKNG7VKJ1SBzWPsQOf8wW5StYj71m6ONvFe2UfulqRZHSUo3/O
	J0ispPcIVNfsRZ32n53jRa8qvN12z7UOSUJ++/HaG86iFss22mAmW45WhiJgBJZS
	p4Ki82l92r82hHnoRwTwQGSmUtZM6DeS1IA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrrkbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495dd0f07eso242109985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795018234; x=1795623034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DyjFwh0daqRWVGV8alAfLhW51+EbUV4ESRE/kWsbJw=;
        b=idfRJWM7LzK7+QwS8ANV/acwK5p7rUilPGhVvDCjItcNG0Pya/7/UAVgdirDXxq1EQ
         w63Jg6UP8BUQrBIdUk8uei0mmD3RZLTJRAQ+fET7enOX/JKLnHZL5EWc7JXqtRHWHnzO
         FfaBGfBjTmvlUQxZ/A5I2W6ms0xh1FhF5KQVlEDZl8OxOHTwQ0KnCm4CbnrVNcBIoB2I
         IYGl6i94GxwOem1WsL7/f9tN4xQHP23iGFK4abuyPsvz7tS8GB5/CKdfQ0GEfY4ICCA2
         VpQI+HL8LSCxdWJP7/tOWU0TpEP3WtLmpi7s9/0630qpd9mceS/PTqkpEATCQqHtRje9
         N/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018234; x=1795623034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DyjFwh0daqRWVGV8alAfLhW51+EbUV4ESRE/kWsbJw=;
        b=hJpDjBQRv7Pm4xRUuglCohtuk3+Zl//HzwuAhjXIx5ffZ7lbP1MKPN+b1bjsXjdN/7
         o+qAmKCCyeyormS0yDcDm1hElHQQp3aYI3t+PtQ/6NSbHkAniIMvPzy9fwADjZbEuU5m
         81dBBvo3285JFrALQ3wVUxdTwhpuTvhfTug+Xu9x2QMQEWwAHin7TCLIVkAuUz1sJHx6
         o9LDjgtzZ3ebHbRcPOMiOSSOfICC6S4En53i7pwytLgKZqHUqMZ8Ks2YKdYEV9d9o52t
         7P/m09FB5gkHBmnEDYn+edY3nrEuPkcQxa9YMNH1dJ0ZapBKsj+RkYYeCXWdbvYUn7O7
         QQpg==
X-Forwarded-Encrypted: i=1; AL+hErFuppxZr3/QQ6pQAl9dpPGaw7mukNgowSiUC7szdtco/xfQ33OBraMXtlfeIuKTva57CNAFtPmOz5IJW1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z90SI2v9zyGZmWw1B1O6TuPOUry4LmepsLhNaNeUxd32nOLGu70
	lT8uOrCsleJpvTifovaomAErLStZ+o//JZnseAkEY9MtSP9YP5AegB5k8V2ZVVl4GOZLJocxeps
	Klcd8dSOmGAJElR5DqvH3o+v7l2aKX9O2e0wchEjFpodatm9LTDS3M/s703BaHZmtt6ipQO5xX6
	1Q1Q==
X-Gm-Gg: AYBFou2Wu8zpsdW8olrqvS5Xz+nsjZthRBPc+NXwjtiSl0WTcEzKqp3Yp0TbvkpwDwH
	yZCNxiMfFqWZ7tUyG+Jp6cIwuPTyNFVrCwGd8FFvh0bFXnk53qxQeSp6q+uLyXvgQGo2F24xB92
	wXveKqHbBNC+JoE/iFP6yiLX02Af3zRhvrlTffPep12iziRnDS9EYrZxER6Cfelri6gohh4HCQ4
	Z5me6Kld07XOlXmj+4Op19gLCGzATckyZWVJQqasqpwn5CSjNc3Jc6H890rwaCIdikSpNG4gXrV
	gzUiceJ9r71ulsdQipAxA0+LzTRJVmVMhAv5i6L+5RwPB1CozcJy7O+qhSe7Kao2R7Qi3cVhaiq
	MqDRNPeeiXyUo1KEyXJfgdLY+5FNIPTzbKdJA7Xo3SvLKdBIsD8sywgDNfllDeEMpQtGQ3qeDo6
	kX
X-Received: by 2002:a05:620a:4551:b0:944:d7b:e7a with SMTP id af79cd13be357-949995e12fcmr574557285a.52.1795018231563;
        Wed, 18 Nov 2026 08:10:31 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:944:d7b:e7a with SMTP id af79cd13be357-949995e12fcmr574519285a.52.1795018228092;
        Wed, 18 Nov 2026 08:10:28 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560911fsm5762628f8f.26.2026.11.18.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:10:27 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
        Mario Limonciello <superm1@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] platform profile: Restrict the core prompt to COMPILE_TEST
Date: Wed, 18 Nov 2026 17:09:37 +0100
Message-ID: <20261118160938.3057738-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfX2Wzlbn/lmgjb
 fjMR1ii+VAflHqHBNKZRhIzY2rJ5pWEQ4jByB7+rErmfViRUP4K8RehsnIsf1M0mkRKJ/oIqzjj
 ihjUVEzkPAynhkn6U9xkjAamxQJm5376aUELzbeAwPmRwPu+aB7trUfQoLq34KVjSHOCYXI69QG
 4PqhKHyT58m/5RTu8Ti/VbHwLu9sOCuKlOvOIwIURakCSgRQNz4VPL3PGWMQ7HlJZ5NO2v0KkKS
 TqC3xY/4KFs/18eG3NzPBFq9c0m1KJpdboNDfQ0nKArm3kfFRpoyTYIO/vCoEsX+KB4f94R7Ux/
 r8lPJ7WytYPQ5a4m7lKa5tS8SHbWQHgcii7zfRG9idcZ4z3Vq0jQ/dAYNdPVtWdMYUvhWvJxsha
 n6SQHrwlo13pgocLPTk/D+N+48dTULuTZOlMNJYRtywPvTpndqMD1O/lSWGSQ2SMK5ATePfE5nZ
 sJLSNf9iafrU0PEtqOg==
X-Proofpoint-GUID: uT9zrVswJ7rs_gvzIK53B6QtgSewpIjc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfX7cZ0Hh+fJIdY
 2dLNcbMizSi0rN9c7K9Qvb4Vblj8UiPkG+G+nYDBykBkz/wRHt3yzWwe4283egJDaLWDJqWW2EQ
 EBRFdL/rJCWmHrBpj9NDG7KRUGEQLPo=
X-Proofpoint-ORIG-GUID: uT9zrVswJ7rs_gvzIK53B6QtgSewpIjc
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdcdfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=XVxARQIAAAAA:8 a=eSez5piW9hGb_tCy0SwA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=Oj-tNtZlA1e06AYgeCfH:22 a=p77dMD-AzHemhwI1qD6W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180064

All platform profile providers select PLATFORM_PROFILE, so users do not
need to enable the core explicitly.

Only show its prompt when COMPILE_TEST is enabled. This avoids exposing
the option in normal configurations while allowing the architecture-independent
core to be build-tested without a provider.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 7270f24a3b6e..1cf87904afc3 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PLATFORM_PROFILE
-	tristate "Platform profile support"
+	tristate "Platform profile support" if COMPILE_TEST
 	help
 	  Provide a common sysfs interface for selecting platform power,
 	  performance and cooling profiles. Platform-specific provider drivers
-- 
2.43.0

