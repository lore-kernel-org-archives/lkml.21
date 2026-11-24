Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558112;
	b=ijk0+RoRsUWNI1UJaBaGgNNwX5gkk2bDo5czfQdbT6Kk2axgJElmIPMfQAorKv3evUGG
	 BmfYBKzAHG1MFGKCylcTR6V4e1vQgsyLMqiYwoYRxmeRIVHNjBoa1TAnv/ug3QQanm45p
	 JR2I8NT8OXzd6aN0gb70EGGzJ2QF4IaEQsuzdiHAWYpyYP6nyKXXBe0cp4Y0TdqIBuRsO
	 07hWAz9wJyMgJazqVPBxte357bue+istO8z3Ps5cJjqiJ8p0YiaWY5lPItzjJ6CaKPA1L
	 GgJWA6XPnDwf7OhrXXZLTXjPDbI90k8dsO9vV/Sr9z87hooGrXguYXHfTRShE+trCAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wUd7P3Ye34O3sWY6zQup7AwNcEoSACo5n0ZnarzR1XI=;
	b=aioTTLbycuMbvFqBXVhwdp2MAmF8je9tNs+3cpYipF2kLSYvKXxEZHGawL+4uO92lqnv
	 yuE2hYOQZNNWyFiU/NRld8JIFMxp8tjHQrXiAUIcZbjJoRmt+dNnPOE/mxX1xXkOzMlOY
	 IPVsw9cUIXvq9uGDY33Fh56uu/JJJctZ39WVZR+kc1ogktroKqOxtVLlpLh2fQVutNgpO
	 OOXin4M7r8rQ5nRSOQ18S0ZQdR5yhj05twkR+iddhM7KZ0s29oSIXhjEN/5jLzkc+WAfc
	 +huVdYOTPraG3YiM7EVtASJFiYnxqSAv0WEjAz8u/4CSNoHMykKBrgKxJ+tQf1ImnlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JFArw5gx;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cpKA93ld;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD02606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JFArw5gx;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cpKA93ld
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOLXJPv3412684
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=wUd7P3Ye34O3sWY6zQup7AwNcE
	oSACo5n0ZnarzR1XI=; b=JFArw5gxspepOPID2sCILSVWBL62zA1klYsJ7L0s3j
	mOyS6r4fCbJwPN8phjF0SlzHJuEJSmCK4NCDrWcmZiodznvt6H9U3enfhyLB1BBt
	GMeGTESD6Lu0s7Qe8VxZtF58mFV+ragHiqZ4UG4zd4DocY88bbIwY8EZbM8sod7b
	tfgD+nSrMRc8NNO1aHJJN8vO4B74oExHRrV5hhuZMlwzv/dGBzdwRfh+TKIDQFQ2
	9k7HanLce70Lkg9n9hdGqFHcbaZOH7w0Dq0pKOqQDXtVfiz0XOQsTRMxn7l6nK2f
	vo/0I48irWi0iRqAW5xUVY184z+oZUxe50sCqQ8ViawA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j5euktq3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:08:30 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92106c98714so104200796d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795558110; x=1796162910; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUd7P3Ye34O3sWY6zQup7AwNcEoSACo5n0ZnarzR1XI=;
        b=cpKA93ld8v1LZnPqOyIfSem64jpgWC0h+R2fzejK1ynoPZg3MapwXMFWB2KgaLxJGM
         Hm/h0WINz9LX9qtOINdHoY3FEz5+/VwC+MAGo4vpHf3OMAT4XRcq4fRV7B4ePdq1NHzJ
         2qq1SpWkw5oJ7Ls8EmmdUJ0wqXbhgFdz50SCno88c4UlIGyUbtM82unY3qxEVaD4fMlz
         Ko7z0Zv5GYuwXMVXfKh8z5KsGsKwTVmax44VWYgTyLrNC+ifp75KEMJkg9h0W+rTgVoL
         jH06hkEtz7sQVON5uCtz2JDX9oz+f5BQF1++crDoCRVgQMwis6ljyY0jImGdmuCUnGuL
         NOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558110; x=1796162910;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wUd7P3Ye34O3sWY6zQup7AwNcEoSACo5n0ZnarzR1XI=;
        b=uwTs6cdkaN6YRREtz1Xjksna3oDjjHkozbdXyR+v5cSvjawX89lwHB2gZIhpZLHAf/
         ITl3WQmRB8d5wxxXF/HYdTvOAqW6IB5zHovT+JbYGzr7IFN6wyoNYpcrRnaRsZ6ce3GL
         M34GUAQbJgsG+O1OZqG4Zhwvkc335WUzDjD6sLiV9RvIhVs9tk1RGL05uYGvsbVOETJD
         x1r3X0JvRZGbtSXI0RTybdwr5PROWt/wd123tV1AGLb6Znm14TemCyNQR16GW4iZRAki
         KiPMwzvuroGJ5pslHONt3DYJpXTs/dzuWPgnqAQDNtprwGHXXuAwGVNUtbMNCJOrv8d1
         l1Hw==
X-Gm-Message-State: APuU4Z+yB2wg6+E75VZGhbtX8n1Ff33kVFgLvfa6Ljz0Oug1uIT1k7X4
	DwI5W1XWkRF0rKUmX9b4f4tGjowy3jMCieLHbgmd6yU1LfpC3gciIQKK1Ms7pZTm5x7DWXCFpvz
	OiCKvw/r2hTmFxqtnhiVs+7dqiXiXRC+3UblMVc2guCDDf0RMeJNtdAYUD+gnUw==
X-Gm-Gg: AZFdTZeOGHuy/cv2s46c9r8ZI1iMtjY6ou4IIeEzImj7NJ3xSrLGZT/2rsIgmvE7Mi8
	O8tXhHscmfX+8sTNS8YlOgDukhodwECzMumfK9IJExN2ZrLkwPRL+8mmHaIAfk7wpkwBVJPq/D4
	IkXpYO10OJjrtVONjpRtu1URS1BD1+tbq+MyMU3P6A/YQ2GC/1ShpgTtW2UgV6yTLR19+6vA+uo
	KEe6069ob3eqylKtG6m0ipubc5bKaX51VAbdjeeBYBJOEUNTCSh5g38ggeUgNxvfIvwYI8Lzszq
	TRybXlCa6hs/VHbNSMcR6PkwCm42aqo0/mj6j/Pf/uTcf5BaaJ2X8evG1t5x8pyDKNKK8eKyL4I
	FTJ4g8M//VZ7Iga7WZoozU1kDwnGxo/wPVrX4RewQiExKZDVKWyqd6o/FJFU=
X-Received: by 2002:a05:6214:458b:b0:917:bfa7:2598 with SMTP id 6a1803df08f44-92134aae4damr283166476d6.18.1795558109770;
        Tue, 24 Nov 2026 14:08:29 -0800 (PST)
X-Received: by 2002:a05:6214:458b:b0:917:bfa7:2598 with SMTP id 6a1803df08f44-92134aae4damr283166086d6.18.1795558109408;
        Tue, 24 Nov 2026 14:08:29 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b3a0csm144944586d6.14.2026.11.24.14.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:08:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 24 Nov 2026 17:08:18 -0500
Subject: [PATCH] virt: acrn: unpin the interrupt monitor page when
 destroying a VM
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
Message-Id: <20261124-acrn-unpin-monitor-page-v1-1-097458800936@columbia.edu>
X-B4-Tracking: v=1; b=H4sIANEKBmsC/yXMQQqDMBCF4avIrDtgIo3Qq5QuYhzbEZyEiYog3
 t1Ulx+89++QSZkyvKodlFbOHKXAPCoIPy9fQu6LwdbWGWMN+qCCiyQWnKLwHBWTLzPX2P45tK2
 rQwPlnZQG3q7y+3M7L91IYf7n4DhOEA6cy3sAAAA=
X-Change-ID: 20261121-acrn-unpin-monitor-page-632d5f7760c3
To: Fei Li <fei1.li@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
        Shuo Liu <shuo.a.liu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558108; l=1265;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=H8wehEAUOYpvrHyb1qYk3+1cUineECJ+mIJ3t8JdECM=;
 b=byMqRJeO06XTgFeiumRYTldhQ5lhm+UaD14l657W89Gzqzq0DYteCj4m4uGEgSHVhs89eKLg7
 Qz/fKrytaDKD3CcTN2ZwajcFVXFA0RLsAwD4XzsAjIIgU6q2sb3PAG1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=HJBWhYtv c=1 sm=1 tr=0 ts=6b060ade cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=VwQbUJbxAAAA:8 a=vjun-3o0SPL4aK9ehdYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: LV-CVHTOAHDkXytEJlpTmotNDgg7zAwi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4NyBTYWx0ZWRfXw4PAhqIuFUkp
 UWEDcgYvg3U2NJnTVWLIGNA6Gh0l5e9orDG77b69D4OfKBXuA/lEtLz17aD0FjuG96X3ap4YOuB
 mu1gafnbV6GThlCk4kmttbcH+DSBBbydXvOxaUs1ryy3MqnjRbz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4NyBTYWx0ZWRfX3xOO5jhtPcSa
 ktrenFU4VjoskhOmejviuGZfIYmGN8+nEZeb88VWz4ljhTWdDosIaZUEeQQmKjv4ildfMzihOvn
 2myIUADcyI53fk1lnenzaCZ7MmJrwgJeHPdl3mt8Xi3ZZRxpFFfKFTVGRY9qI7f2ftiPB5GqmWc
 tgAc3EUmIdcfOJ7C32E0WF91pHURrTA2pAsWN6nWxFtUnxYnEDrWbWGhDNYTM/mPF1g4aAtt/YX
 ++2ONduNrk+BTkHB/stjBBAqL6nE4dAn+i9DOy+SNa8oZt6kVD2ybwNqC4Ly2aewhXqlMM1RUi4
 qexKh/fUYFlPk8qRRN8G0nLSiqsCCoXtORhHsBkchkR8YNhUtdV68rnmeMrFlLQd0Bo48s48hQS
 XdXgf+osbNrcLzNicaMqps73wETEO2lrj0lo3N1fPbfOqi0APz44+ijwzs95Tjl9p9PAHOcEgNf
 V4yU4Qq74inlHPCeTzw==
X-Proofpoint-ORIG-GUID: LV-CVHTOAHDkXytEJlpTmotNDgg7zAwi
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 clxscore=1015 adultscore=0 bulkscore=10 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240087

ACRN_IOCTL_VM_INTR_MONITOR pins the page it is given with
pin_user_pages_fast() and stores it in vm->monitor_page. The ioctl
releases a previous page with unpin_user_page(), but acrn_vm_destroy()
releases the last one with put_page().

put_page() doesn't undo a pin. A small page is never freed, and a large
folio is freed with its pin count still raised.

To fix it, use unpin_user_page() in acrn_vm_destroy() as well.

Fixes: c7cf8d27244f ("virt: acrn: Introduce interrupt injection interfaces")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
Compile tested only.
---
 drivers/virt/acrn/vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/acrn/vm.c b/drivers/virt/acrn/vm.c
index 3753b27c5312..49643dc52831 100644
--- a/drivers/virt/acrn/vm.c
+++ b/drivers/virt/acrn/vm.c
@@ -82,7 +82,7 @@ int acrn_vm_destroy(struct acrn_vm *vm)
 	acrn_ioreq_deinit(vm);
 
 	if (vm->monitor_page) {
-		put_page(vm->monitor_page);
+		unpin_user_page(vm->monitor_page);
 		vm->monitor_page = NULL;
 	}
 

---
base-commit: c44104f3642da720164042623e4832836aefdd8e
change-id: 20261121-acrn-unpin-monitor-page-632d5f7760c3

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

