Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093023;
	b=oF/d4USQISsJj82XSmEKmI0Ul58D3HqiNQHBaz/KStAKHkcNlD0s+UAS9WGlYouAuQr0
	 7z0lWhCet+Hu3aZaQc3qthvi1cc7vkGLaaLY0b4KYN9dFHuDq3kH66nE2Id++GoeHEQGF
	 cmNv5hOAbt/SsjpihvJFZ3vSZoz3hZ+F2b64gBwyqsukP6oK3QWSyG4T665u92g+vlVyq
	 DuR2Eb2+kG6dL8dP3gKQ6XRoeuxLL/jEiJq5oFeTEaZPCuDtlApkGPH8qR0/t14wWVYgi
	 ZF43UtURH+osnuyRTGINYLAiba3geA/vk2q8eO+xzwgXXIyEVYyuZC9aHAFtl2PO3bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
	b=TD9GBANn9EWEL8rz8MnsvAYpOdlxpPtmWz8eVOeTVd4dr6ObwznMixNEtmeU6jxvtwJ8
	 NWNxuCSBoKtu/kzOsKFS6j6ewvcfNy5g7veMQYz7S0qX1zqUqd/4cUACDKyoTxC9dls66
	 pOjz2lzgHU5Pq5W5i0ezppDrCiRI7XFpFOZq9b5an9BH/4k8QnGm8/slwshq5J4AEkj8u
	 IVI9SLtWtoqkUrmOeu7fw1dBQp9jET1LGqDcNA3HjzZ4j/rxUKZmIIV0w+3lg8ZmNdVWW
	 Pafe/12p7sHAr3fpaxlGcV1Qw+6LKCdDtW/WkPl+9urHAUXFabw8G7kblpKwsImWn9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Jm+aKW/B";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4B606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED4B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jm+aKW/B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk7xl3320024
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=; b=oBnV9XRNseDfl5P8
	2AscwJxNZGf20yy6EJFwl3Zm3gjUkPbkGy+EOIa2qpQ1BM0bJCsmhZTiidPWYwi/
	y0OcXHMgnn2Wbo1hxB+UbsgFJb5iYfX0hYmw3+t6EyUo/mkWWxI+G62pX+qE5Tp9
	4+X2XVG62d8B0H8bqdN5TND2DDhCPYh74yspvPaqJTQGLwUktWx47Qpv4YMmFTx0
	ooNYWnUAmGK2rfgIqn4PJJfhVP2L7kwRs2n0jzrCxfNH9vDtOVrj+VDyAmGi+Naz
	UwWRud5F9UecXjDeeFCDeTk/9PirC1a0tsNoufyDkuUju+Yyp/9yHRk9dkju9tyB
	5uQAOA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18n8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so5362195eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093021; x=1795697821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=Jm+aKW/B9vuNGDgViYiod7XDLz5WaYjy1ngzfOf5CGnTKsKOIxyE9i0Jgq3WihRLt3
         QJYRZQhiX/V2Mdaqky0Lh+xc4jdoLCqwI0t1UNmP+VtUoieOMn6Q/X/++8ghrTcdh0ed
         Y3YYgmpRbK3skqy8jEDlAJgsipozwE0v9p6cVFR8VkIjlnNkF4apQ3wly1Mw/fUCXMRJ
         OTYZVrhGlkloee/TRjh1f9na8EE+jXl6B2gBGXLDO0KiM9TXhMK+BrxW7Hs/I5Zf9dgJ
         uT4b9krJPgW9bFn3btjx9xcPAXjb04mzgZ2W9Ki3dgVh8mf9/PpJA2LkldX4AsjWSVHn
         lEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093021; x=1795697821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=cDp1IszpXPc16uUavVmNLzTu4Ti1T9GyUqBxANRV4VJcNn9udOOPdR784wfa8x8xtR
         WapXBZdG3mmpG1Uvv+iDTtbqUfbpTvkCLibGonbAQfqFtEMVgRBopPRo6IHoJEOgGN0A
         zg65aU6qu/bv6Ucqo6lrmorGmy9cZLtWXc55OnQ0LNDr2xJK9AO9SBzJgQcCfiaLNhXp
         pnwOnv8GY76whWfN8hIviN5yfJTU5moMrcxCnisCc2odIYaup6iasSIQlyy2vjbJY9If
         lsI49fCrRxAV9M+PE33glXFI2i9CPde1zOdBrDC/kz6csGmfenGdD6Q0qpjgdKOPHgSh
         IW+g==
X-Forwarded-Encrypted: i=1; AL+hErHtqTWeoNFHt73m3+FTdI3sxE9fCSKLRgN7T+OexBCpK0Kh/HQyA45GwuF2BV9vAxca0aQe0FDeYlt3i+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P6bV3bqJnqvwTLmZ4Y5CQFX9SLxXqf2BMpYC+wc2xsxn/9U1Y
	RcS4yAk6BF42c6iDkmC8ssTbWX3uwB56ktWMdl06EeNmXHkId5Ux1Lq19TWv7wpakkkbBD0shCS
	RBu6HM4F/H9gPyh3z9ydvLeRsdldf2lQXOv+yFYegDK3BOqKHIVmyqwRNivMNoaJcKvI=
X-Gm-Gg: AZFdTZdwc+13eRevWiKyCKYvBkqRIy6up/5gvFVSmgBAAhacFeAEc5i11t+S4ZQsZFO
	xIQrouI/fMW/QVTraed4+/DlzPbjhKgSaI3/+pjr4oihRFbtCE2044zfiuked6MstrtJBB2qQNJ
	0i1eCrCSHpM9GqMeiqvQbkwuS8+W/5lhzHjD0fwSFVPHHteCh3fa251KMEjqJi7hk1z7OY3ka4g
	IY/JDOvWf+Kci98h0oCr3TMroL6Btt4Q6SiW0KtTMTL+PlN+KcX1Mzjzb5fCEL+VPxwlgISAHi6
	+Ivp9v+PzxJbCXZ9kcI0mWHIdL8Mfb9fQpBwwPwfwYSjsBuN7V5TR1/Dm/pO5bZd31JFRu5Phra
	hg513nX/ikBMp2OSsJBIWchACUfoPehRCf+g6zm17V+blRqw8pYk/eCxMuOWJ7zvZG08s8Uj24/
	W5+mwZIP0c
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958721eec.22.1795093020392;
        Thu, 19 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958700eec.22.1795093019864;
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:33 +0530
Subject: [PATCH v6 1/7] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
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
Message-Id: <20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=5883;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ym0w2JFu4Q8J6SLUhmOn7q9U3/O2c9O+f8dhYs9nmZk=;
 b=GKA/21jMYBH5Y5+9KJeS83+AIQ1zL5YHNq0gXkifEGDCeF/dctt/LHjNzfDkOJyveKlXI/nLH
 qP9dXMNA6ynDswC28JhwmChVx+Iz5srSsrFpQNqJaXTrRR71SdZjLoM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afef21d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=m7h7XtmfQhPoxq-7kmMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: XijbU0G_-Fku5olKoSG8b3tEsH9ddMVI
X-Proofpoint-GUID: XijbU0G_-Fku5olKoSG8b3tEsH9ddMVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXy/6+Ppx/OGTI
 7XYAsmmvcq4Lyx5aTSNjSF2365C/6E/Ms4t0+Oh4kquQ9K0Nud1tQtlqYdPYpBX063gwVGiqjFo
 gNxmxGpGClbY7TtAhE7+z2+fY2lD6b+OJTrRPrezTzAj47LPUIlz3yS7dDZVlSSiDVR/ZCOdyKo
 8FO3VxyIt4qPOqA1E72qH1UgJv5UJhfvGVH9ftO0IaCrI64wvRv6hkC1+kirXM+F23ZVzZxol3+
 jeb/1kQOYo8CpTp6gKlVApR0vk8skmZuujpmj9PDh3Rh2RO99aYXLEm5CAbr78KIrA10xtQ5BZi
 kGtf2p3nTXNf8iIXA++gQmDBVKbwuwG6Ptm6aQSXQ/s8xE3bQ2ZKFQGbrNAIc3403zdXJXoF0iq
 8r5HSRkW2W1yT4bmWpKhLBHNGkMzGdApmPHkPEyIHnkVtJ2Db3Hsgv7LUqYmFh1bhpJdoi42FCW
 lq6phl9YDTYWebC1MYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX23WDtapkOX/n
 GDgz5e7EjG8VXcGrciCMGAP9r76PD7ABZMbLaFt8NOnafCHGC6VmUsdOlVnNaYuPjQ51QJeOrCU
 I9qtJ3XScqDxpVFDDbZPsHG66CAbnC8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

PCIe host bridge devices may need their operating point raised before
retraining to a higher link speed so that hardware resources (e.g., RPMh
votes on Qualcomm platforms) are available at the requested data rate.
After retraining, the operating point must be updated to reflect the
actual negotiated speed.

Add pcie_set_opp() to look up an OPP on the host bridge parent device
using a key of (total link rate in kHz, LNKCTL2 Target Link Speed
level). The total link rate is the per-lane rate multiplied by the
link width, so that OPP tables can carry separate entries per generation
and width, e.g. Gen 3 x1 and Gen 3 x2.

In pcie_set_target_speed(), call pcie_set_opp() before retraining only
when upscaling (speed_req > cur_bus_speed), since only raising the
operating point requires pre-staging hardware.  After retraining, call
pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
the votes.  Both calls are skipped for downstream ports of PCIe switches,
as those are outside the host controller's scope.

Some controllers also require ASPM to be disabled around link retraining.
Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
pcie_set_target_speed() saves the child device's ASPM state, disables
all ASPM link states before retraining, and restores them afterward. The
child device is used because the ASPM core ignores requests made on the
Root Port itself and configures the link through its downstream device.
The states are restored with pci_force_enable_link_state(), as a
plain enable does not undo pci_disable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
---
 drivers/pci/pcie/bwctrl.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h       |  1 +
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3b1122461ffd..c1e749df5bbe 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -28,9 +28,11 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci-bwctrl.h>
+#include <linux/pm_opp.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include "../pci.h"
 #include "portdrv.h"
@@ -98,6 +100,37 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 	return pcie_retrain_link(port, use_lt);
 }
 
+static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
+			enum pci_bus_speed speed)
+{
+	struct device *dev = host->dev.parent;
+	struct dev_pm_opp_key key = {};
+	int ret, freq_mbps, width;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	u16 lnksta;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
+
+	freq_mbps = pcie_dev_speed_mbps(speed);
+	if (freq_mbps < 0)
+		return -EINVAL;
+
+	freq_kbps = freq_mbps * KILO * width;
+	key.freq = freq_kbps;
+	key.level = pci_bus_speed2lnkctl2(speed);
+	opp = dev_pm_opp_find_key_exact(dev, &key, true);
+	if (!IS_ERR(opp)) {
+		ret = dev_pm_opp_set_opp(dev, opp);
+		if (ret)
+			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
+				freq_kbps, ret);
+		dev_pm_opp_put(opp);
+	}
+	return 0;
+}
+
 /**
  * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
  * @port:	PCIe Port
@@ -118,9 +151,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
+	struct pci_dev *child = NULL, *dev;
+	int aspm_state = 0, ret;
 	u16 target_speed;
-	int ret;
 
 	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
 		return -EINVAL;
@@ -130,6 +166,27 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * Host Bridge resources may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (bus && is_rootbus && host) {
+		/* Get function 0 of downstream device */
+		list_for_each_entry(dev, &bus->devices, bus_list) {
+			if (PCI_FUNC(dev->devfn) == 0) {
+				child = dev;
+				break;
+			}
+		}
+
+		if (child && host->disable_aspm_for_retrain) {
+			aspm_state = pcie_aspm_enabled(child);
+			pci_disable_link_state(child, PCIE_LINK_STATE_ALL);
+		}
+		if (speed_req > bus->cur_bus_speed)
+			pcie_set_opp(port, host, speed_req);
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -154,6 +211,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host) {
+		if (child && host->disable_aspm_for_retrain)
+			pci_force_enable_link_state(child, aspm_state);
+		pcie_set_opp(port, host, bus->cur_bus_speed);
+	}
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9cbcadd08f3d..352079393edb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -673,6 +673,7 @@ struct pci_host_bridge {
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
 						   system suspend is broken */
+	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.34.1

