Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670243;
	b=CnlkfoSLXamQQ279XPrMSX1enHJmxM0WASLESxtJPnsSNRa87RNRuw9Glo+EK6AI8itB
	 UcZWPszD2H2fhuVPVbcy3UW4qdsg95lqDpxqnfL+bLhv6RW3WdT7kXZX3KQ1o6fNFAIJk
	 v7Hr2SAjXYujxBR9rsrf5OdXVffrYtmFhS/e0hWtwiY3jXNBVXz2DpVQCPckSX9RjvVlX
	 HrYv92ZMs1D09VlvfEcgN8I0DJc/bpUAWOb6qZNNzbbfzMEM989DBJGtXTMUgGa0BZWfA
	 6W4N7ipJdtH3P2+t8RNAhabrK9kBRrNKTIbGuHCkwcNtuDwDAfzploHqdITl88rNWYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
	b=BNF9HuOTDdOKoOazyy10mPBAY1dJxLIIZ4eTp8dSQ4Ph52vyVQE5QkJIdoOFtWoWcM8v
	 IQg5oTJBKZdhaim3ixYztGjqP5TKfFlaHOXWV722HgsCGkxjm7CPmvSA5UYHJMpzIm9eb
	 AejQcDboLKuplcvUsO1UqY2MPP0k91BpYoWQhZUQqB3xtrTOwUWQYeQ2RNjh2TjNGvlTf
	 q1/YC1CY/zfFiWQcv8iKVk5YtIQ9KJdSv91EFCV2yU80bEsmGHUp6zDvGMwFAUrSQsAMN
	 W7E8XZXoqmPijrgK0iXYGJJVgEYm3JgYlCqxgwoLkUNz2TT0Fy2iXUvoM/OCsDjlBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E7Z/vZkW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUYYnl4x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B01606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B01606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7Z/vZkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUYYnl4x
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36XvJ2791265
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=; b=E7Z/vZkWw7uxXA++
	EalEyVbJeQ9ZLWVZJeI+8FPEIowMfBSWxVdvDpEECuZMrJIyfb9y7F7pnaP9I3aH
	zUur194t4glPzOK8KgbvR6lHhXv4f+myDAFB138d7N5kEJuFzzG1aJDut3ouvzuP
	DHPeF/mfE5JeL7P4dqylP+qZE+GZkFrJP740dNwTlD+GEfszN4vPttybEDH+fLQX
	Rn9JfheXnXGC7gEHt7UIflSXch3mEikg/R3ekIAM88V+9OuhMF47MzCUiUfnFajs
	zko092A7RglnVIhOfaaPNo5Il5VtVoo3MS1Bg0WQQ1MVB6nUsFUaqHabfAR6x9+e
	9WI8lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnuyqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso10744406eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670240; x=1796275040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
        b=TUYYnl4xkv5yyr0k2Sp7rH0Pi5cJSfrl49Yrs4Y3gchxtXZtlKSuK9KkCJBPLPIJ9Q
         vEHBgBn9fARZ5b/jWUq2cqqjI5VbXWce/RyKWMeZk/H0dQZCqXRoeWp0LInFmwRK/Xq2
         1Hpy9dAASZBThLU4kx8nQco1knmtVl1bV7xVwXdCtnMUP0+V8BNihlpBzGlMwJCyPn6c
         8R3XaQCOKH+5jU1G6zLoWq8OeLuApo9ybKxI1iBDD0oM7uy4ePlJYvwJMRd3xOTwL6OW
         8a4oDR4kIWcwvvrUsZs/N7OBwR2O9VQzb7hugnnA1sILj2JBpgwE+ugt0kvAs+ur1Pw6
         E+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670240; x=1796275040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
        b=cH2XDXQVWCOP35k9GJvaKMT1sPRtXJIUSd+/mLtBev+saJGn7l+ZEcWWh4EF1O5CZG
         durRzrVKM9kocJ8w3FEiEpH0phgfwA7bK7qeNcem9VKBKs90UfpbneDCpZO4cXGwk07O
         36RGu+C8rTEctN+TbvDKPiV4Ju4CbflfuTjf6O0e2Zs7HWQL0q5QRT8i5Lpid+0RFhDu
         W4RK8ju7jSP0H0rCmsHIxB49PZniSC8r08JtcHeue/MTkniep23uu1SHujVui+K7rsvy
         eC9ND76aO9dIgWR7hV3c1vt4QqlU4aOdBm6UlWlt3m86RSyv4XCSq3hYTOT4CFutRvYC
         a5YA==
X-Forwarded-Encrypted: i=1; AL+hErEWRIEs0l6F3cfNDVdRATk9tk9DtjrYT7LMdOjZtNvOeuTFaGDsq5Q5Cm39fOVvgL64HhBXA0LEA+7HvzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V9EyglHmikUfjxmxayIIoYtb1xhiApxBJNQBLZGRreGBfjpr0
	zLnaLBYp97s6jH5BasCxomb8pyHsBRkyCFqdYmQBxkLEyS2f5tjBfTKKUGD8adbCdo2QzvJlP8e
	W9Gj6Qil3uvv8JnZNbDUo/HJFKtgT5pu8fc9RFSVbDx2uS75c8BQzsjSNDinOSpMazjg=
X-Gm-Gg: AZFdTZfWaLQN3qiTpDcbFARBL6ICdw1b5DkKO5JeMqYVVBRJpJpNuYsxps5ylOHFb+u
	KZ6527Ohg1hX9hhLDccjHKf1oikt08cWC/ZXiFOwF1ENrvGK/Vb4tdzMGOd9OJqw9cxJ/q2PAfS
	otQLeHV73bCHalq/frxUyWVPedF8ftmY4qQUBRsdC9Ob+0100VnaBsiAH8ZuvsbS5mc2jIL3RII
	hbHYw5DtmxPfp41l2/PN49Y9U2erE6+Hy5uivT1iiEtWiSVGkqp2iDriqT99GbFiuSlTNjHmIg/
	UXRq1qlluG6kQx7RKghIeIx/eDSmWGlUJl1sY7SgVvOqTABwVUPKZ+2GGpjYHJCPEXPNAxJtPMv
	VQECxT69Oz2Q6Z0b37VwPR2Ru7pnvDXpClwWuSEpYCGGTEteL7ATl8IDNbS5ssYnzgtMd+0MX5E
	/m80Wdu+HB
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr27963593c88.19.1795670240363;
        Wed, 25 Nov 2026 21:17:20 -0800 (PST)
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr27963556c88.19.1795670239808;
        Wed, 25 Nov 2026 21:17:19 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:46:59 +0530
Subject: [PATCH v10 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
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
Message-Id: <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=2417;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=AdMsyjE2U658wo9GCc3C4v1LK0MFmWfjDkwn5I63cMU=;
 b=rcI1ccufPYHfbWcNrTqR6g4ZNMspDWAXucjiM1IWLplFLDRprXpz3ufm/VdbWcN/GIKBddpSO
 wmU9knpq7goCMe3loOpYbdMSkmYK3oBVZWAFWCbnUKmNDoKtgn/+VGW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX0SQMXuCLDLa8
 Zy7TM/BXe+kACJyiJPa5SKYZVIfnKZ3GSKaH3exLT4V3B994Ir/aYZ6RbaUZIysZldOKZNS0rgv
 NSL6op2jNcBHF9Tv5uektgNoL9clwksXVry0GagC21OJx0nTEerQOmfI/Cp1tM9mCU79kYGV6AR
 eMmqUSXFalpoDWtXl9UmD+U7cGVujCwQBhXSmLWjqua4C8f2dllVHtHKTsDTDUFjhCpFlsAaCCz
 qWiDqai93IisH0yclfDnHIBQAt0Xsby9zrHH4XuFri/xpLLb9DQko6+iOUNTG7hjcNUkwzzMW4O
 wmo7AbCf7VDzT6XPjyNN0Md6gfEPAmoipmkpLVPB8caJlsXN0bj9Ne4GIGjWA6uTb/kRVBTgPQ4
 6Vf4TuRt8tShJrmvGjO7BBxUj9rtl5UfIN2M/Y8uwjjppBg85Joce8Uu2RS0RXUatlgog6BjRg5
 ZnJpZdVXksqW18eZFwQ==
X-Proofpoint-ORIG-GUID: ClXUUHYeSfCzrshxG54Slixx1IMDMkuz
X-Proofpoint-GUID: ClXUUHYeSfCzrshxG54Slixx1IMDMkuz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX/DGWoqO+8gv3
 Vk/OxvBEwp2WCya0fSm2OWm9BdVonHUYKv42yNXvnieGBq9BOW4S/4E1oKszGflKkt7vVwsr963
 uJTgUX6aKwy7UdGO6mvM+6vkcDOVlBE=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07c0e1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

__pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
the walk as soon as its callback returns nonzero. Any device enumerated
after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
capable endpoint -- is then never visited, so pme_capable can come back
false even though such a device exists on the bus.

Since pci_host_common_d3cold_possible() already returns false whenever
any device disqualifies D3cold, aborting the walk buys nothing for the
plain suspend path: the overall bool result is unaffected. But it
silently drops pme_capable detection for any device ordered after the
disqualifying one.

This matters for the upcoming shutdown path in particular: unlike plain
suspend, shutdown forces the link into L2/D3cold regardless of whether
pci_host_common_d3cold_possible() itself allows it (see the following
"force_d3cold" changes), so at shutdown time it's common for an
endpoint to still be in D0 and disqualify D3cold while a later,
PME-capable device is never visited. dw_pcie_suspend_noirq() still
uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
result here can cause Vaux/wakeup support to be dropped for a device
that actually supports PME from D3cold.

Fixes: 1d2a29ccd3a1 ("PCI: host-common: Add pci_host_common_d3cold_possible() helper")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..c2c852c64aa8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -275,21 +275,16 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 		return 0;
 
 	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 
 	if (device_may_wakeup(&pdev->dev)) {
-		if (!pci_pme_capable(pdev, PCI_D3cold))
-			goto exit;
-		else
+		if (pci_pme_capable(pdev, PCI_D3cold))
 			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+		else
+			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 	}
 
 	return 0;
-
-exit:
-	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
-
-	return -EOPNOTSUPP;
 }
 
 /**

-- 
2.34.1

