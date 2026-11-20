Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172032;
	b=r5idGtT0QSrCvD9w89jSZwQMv1qqnO1Idj+kBIfD9WeF2OLCalVT8S8uegWInmGx4Xvs
	 xmX6JE/BBTPcrbKBLZwAglro1BzuXTsDYSEfrot+bnBgrUgIpvHFT4PkldIjI9rtEr+DQ
	 Oe31lsH+w/BC6o+SMYr5qrLt+MatFcMa4AzadLC/r3K5IuebvKCf0Ft12FJNKNIn+39C7
	 CriB2YeLSazTEcKmPWgZDKrfGrM+d90T2WohQzmr5LH4p5XmMOVLcNrRS+EmZYdnt1uoN
	 YgyF5etjNdhm8OhFWGu1i88brR8JYQ2JuFyPuSl/AteUSIwTHkII2BbdUIk3xtD3EEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wdWa/4zUENK9UMGMyp2jZmFl6x8KTgGcppwHxjuP6SA=;
	b=qgF54VTbNfP87Yg0cvnTXetljlXkiM76J5K86hDXJM5I7oSa4hdNdpTW2sTrkTIhMuFW
	 9QPSJwDELpqT1MAoe/QxxDSWJZHFrY88+isrX6iOu3fXIbWtJp8+HTVf1hFLgC0ZESL31
	 /mqaC6mCHzEvTQWlfdGsZi3umr2AlEQdJPJ68n7FG0xGTxo27SZIJcu3HwIUMp6pn9yN1
	 NPs4wOaJaAgHNTydNcfemTKKkr+rrHIG/xmLshYjMAkfUoYKDU+8t+wchVO58BH1bekYa
	 xv8hFXsJdVGXQROLjZ+6l/fsBXo/Umtudx2Gq9VI82VJJ+5MXgppPSH6gJahfBXmjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LpDcy8/d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpypiLqr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD48606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpDcy8/d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpypiLqr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6xr3987226
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wdWa/4zUENK9UMGMyp2jZm
	Fl6x8KTgGcppwHxjuP6SA=; b=LpDcy8/dnZBg4E1IJ3a5ZH8uZRvErhbbJk3frv
	Fz8ZWFphPU1S4lnfl5aQajYf500e6q0HMVFUzDq51JsRTCsOG6Vln4htzzMFPek6
	wTTxZgvRjrWq425ODzcLxliBfeSug0Rj44HvgVPwsx6BqZjBSvCB0d+nVFkzT3pj
	WxeJnQ3AqOb05r238ZSuBunn93RZIAnikL6JqFelqj2oZXgSfTJ0/t+f2Zq/Iwpg
	yjM13LVCAqIPT4ZsOHwLHO9oVUiWlmkUzY1138ekDSNhBY7u/3tMHt72QktRydUL
	/rK2/wJ3fdyUkDZDIjYgcn4DAcD7TSZNqq51N0UfyGCYoqpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu812b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so816711a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172030; x=1795776830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wdWa/4zUENK9UMGMyp2jZmFl6x8KTgGcppwHxjuP6SA=;
        b=DpypiLqrY80t912oizOn159blD8CYr5PQQEN89Yogc/bgw1sFsffsadBD/TlDLIXur
         X7Dh71Mr2FaEsoOLLz7xGR6lYOwbBdvXhoOVGzkQrOngEcYK4oLclFZmvfUeMQl7RcwT
         Bd56wTXVL16NlaOUrIxH5zE5ZA7Ii3sgQDg1F0k+wQCinuHMhmD+QF+YhXv9RJV9an4m
         cFucRmoFNJaqeeCIYZSicVVgs/aQ59M3Nj5WXkDxp23Knq99J/ivZGCXRMcsUUvG7wT0
         7ifsvS4l4gzHmHG9sAOf9a+fsq66w97AgNqpvNFNyxw64jTwZBpgD8J8hUT3rGhttPmw
         ue+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172030; x=1795776830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wdWa/4zUENK9UMGMyp2jZmFl6x8KTgGcppwHxjuP6SA=;
        b=fAeK9o8nsp5wcym81RzXShNAFrQX4lg+dSyVcaufmUXwEH6aeVIyayIKJiRPnyDtnd
         tyt2RLXzBZO0OzVmtOTsm/J9MCjUMKFuZJ8l2rtFnzJcYU+ynZTRzDav1Ml6kvQCqucg
         vtJVhyrw+lqQk+Scl/JsRbXfg5tZqi24aK7UYradCDi2VyHd0fuFQqzEG/iqzBVaAot6
         fk/rVNUJPIzhcHIANjNr+OkCC4+vwzqpJTjaC2Vk9D+6XPiv3mUJCHku9PH/6sBeZYdw
         M4xUILIRxm+fqa4U3LXq+Ix3MxbWWur+dBg1TdVBt34nR2GpkpkxXVdteuxi7PgZpsvM
         7lrw==
X-Forwarded-Encrypted: i=1; AL+hErHz0RiXhxYp5vlV9Nesze/6cnLQQIQHkTI4j3JZbo+pSUqPiE9Sj8Xsh23u0f5zVlQy64MZPn1ssj6TMro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o9l9f9lV8awxfG23VlUqF2LHPaj2Z9y+dd6HiihvQVHCOf0X0
	yz0doBQ4LDnHmmEpb8Roys7gInvMaWehF741ChOTyYDqrqCaUrZB6p/+gITeipG7AUpNYhyRH2N
	zMTaQDZiGQnFTNLDkdIqIczeBMkDW2D8Vk5NFtGzIbH9+2wo7r0X/wHYvaojHDtvYT9QPYG5I+Q
	k=
X-Gm-Gg: AZFdTZe35OD5GXlze5wZ0IAL6YgGyJPG5A8l1ku4KNzAndygBfCFCo9lISCjUgG9247
	xvswrKd/eEeo7VZgJauBakjPQLNtOBJjUwlZAd/ggH8TGyWyx1fnyALyFh5dT7jn9sNPnR5L/at
	cfiKd9l0aY8BZ56fXMGkBwVL1RKO6rnjR4txw0mJWzkzMmZgNFHpTXYkIJ33z5/n3usTUwJmEQm
	JbEjqZxLTBonjbqZSkYe0V1s8O1p6mRxcXKXEgxGix+Gq+533Ixe0i1M1ti95Ff/kFZeWi1rVYl
	1g+tl2koRKcn0kgB53xPI6Da5OMpR7aZv1fwKg/yJJCpJRmMTepiEEE5rDL74xwB9vF05+8gTD1
	93nTmjkFYZHiou5FjrifIa3GdubM/sSPhE/27BXRWHvs0BNI9gaPazScbg0i+mkZ1LrT/aQyr/z
	K4ehBgHII=
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr2593218a91.3.1795172030036;
        Fri, 20 Nov 2026 02:53:50 -0800 (PST)
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr2593193a91.3.1795172029410;
        Fri, 20 Nov 2026 02:53:49 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:53:48 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add TPM support via Qualcomm TEE TPM TA
Date: Fri, 20 Nov 2026 16:23:31 +0530
Message-Id: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAK0mAGsC/3XQS2rDMBAG4KsYr6ug98Or3KOUIFujVKWObUk2L
 SF3r+yUppBkIxg0+v4ZnesEMUCqm+pcR1hCCsOpFOKlqrt3ezoCCq7UNcVUYs0IymN/mLqhP7g
 YFojIUdIpikGxltbl1RjBh69NfH271mluP6DLK/PbEWGaS1S+tt2SmmrL4VijLWMuVoLOjuOhD
 8doM2zZGQARpqVxXAAmvFnkCrc2ASrXfchNZV1nnfIcJGO085456RSRwnMiNNfGeGG0YLxeh3w
 PKQ/xe/uFhWwzPV14IQgj6Yn0VhrKvd0PKe2m2X6u0btybORCb4zB6p6hhVHEypYoQZ3VTxj2x
 xBMxD3DCkO56jQITAWG/ZTDA4b/Z8w9w9eltDat0Zi3Vj2Y5nK5/ACeshUdLwIAAA==
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX8x+AvbV+AVIw
 K/vepTTozT6vH353MybEjdyCReovL45dZDpWi5ZjB3SqdAXB0feupy5BNQSKBlOFjFsRlfdLEB4
 Rz1oJt5y00Ve+hxQ6svUiQTHwNqQY7hV6rshhSI3vCgD9W7Ka1+P0Sezkuhc6zB3wPbGjZDUJXJ
 JzmdXmfe5zEzUmhqG8lzpc9wZNsAPriep3dEl9CAapCup4X8Ecm5Cgunfqgxd06X3BVzAevNl9E
 blhkuliebJ+A3ZzNXptFVpZ2SHsszj8DfdPvdsMSlqJ+hwl4XP9t1UUbZgTrTord1SF4Pr8dJDR
 hwBtaEECyFdBs+Xsvkl+4BsQ77RJm7qUxR00K6Gfc5CBM8QA+42oEQNh4eS0rdFxj/rKMkkcxFA
 5ro13ABSZiNimDs4mdj5js4v9ldUTe2iVdkQ1dh3heRW6VeeHLbztPN1z9HcrPEh5HHvWCaw9S2
 gNK8EVElBIPBrcPQ1fQ==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0026be cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9jRdOu3wAAAA:8
 a=b45o4kL6AAAA:8 a=xG2GeFPYwsRGK1jMldgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ZE6KLimJVUuLrTuGpvhn:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: dlgKKgTBgM9US9K8dOYsnZNFiSoIvtYK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX5cg6kv928d09
 xEuQTUsvlccaKOs4RrvJIIqPuTFFMekY4BKRdt6LTOoRi4arSxLNmei7LI78FFHIgqyqmTMSBDV
 caIIij6SUfsECVh0OLZ9/F5t91tDztI=
X-Proofpoint-GUID: dlgKKgTBgM9US9K8dOYsnZNFiSoIvtYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043

Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
a non-secure SPI channel from the kernel. Arm's Base Boot Security
Requirements (BBSR) v1.4 require that access to go through TrustZone
instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
Execution Environment (QTEE), which talks to the dTPM (or implements an
fTPM) on the kernel's behalf.

This series adds a kernel driver for that TA, built on the QCOMTEE
object-IPC transport (drivers/tee/qcomtee/) already used to reach other
QTEE services.

This patch series functionally depends on below(first 5 changes specially)
for qtee service discovery.
- https://lore.kernel.org/lkml/20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v5:
- Rebase on next-20261119.
- Fix qcom_send_command resp_len computation(Amir)
- Use dev_err_probe in _probe and return appropriate failures.
- Propagate dtpm transfer/end error to callers.
- Fix drv_data after tpmm_chip_alloc call.
- Link to v4: https://patch.msgid.link/20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com

Changes in v4:
- Add new line before goto label(Jarkko).
- Link to v3: https://patch.msgid.link/20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com

Changes in v3:
- Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
- Update return values of functions and drop certain error prints.
- Define locality_arg as default value.
- Add Jarkko's tag on all but drop from 2/3 as significant changes done.
- Link to v2: https://patch.msgid.link/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com

Changes in v2:
- Use QCOMTEE_TPM_UID as 81 for service discovery in patch 1.
- Use FIELD_GET, zero initialised array and log improvement (Konrad)
- Improve commit title and other fixes (Jarkko)
- Split MAINTAINERS entry as separate patch.
- Link to v1: https://patch.msgid.link/20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com

To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: op-tee@lists.trustedfirmware.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-integrity@vger.kernel.org

---
Kuldeep Singh (3):
      tee: qcomtee: Register qcom.tz.tpm service for discovery
      tpm: Introduce Qualcomm TPM driver
      MAINTAINERS: Add Qualcomm TPM driver entry

 MAINTAINERS                       |   6 +
 drivers/char/tpm/Kconfig          |   9 +
 drivers/char/tpm/Makefile         |   1 +
 drivers/char/tpm/tpm_qcom.c       | 410 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 6 files changed, 431 insertions(+), 1 deletion(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v6
prerequisite-patch-id: faf4520d818abf0d7533f71d9c8b9a8aade34626
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: 9f2c4ee37ba173bdc860f253d44974379f2cf125
prerequisite-patch-id: e86905ac6289821db30fd9a17f73e276e0a88363
prerequisite-patch-id: 09a86ee4de34e0c9cd2e4664c54a6473d7998299
prerequisite-patch-id: a940a0624f1e130d1fe5213952965aa469bf9547
prerequisite-patch-id: 7be993abea2ca36057d9352381a5890f50996dda

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

