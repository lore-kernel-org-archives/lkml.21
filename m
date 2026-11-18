Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018616;
	b=hl1bGqE+ueLRWoiVjrefCHBueJVz8MadVfwRWjg5bQoNoXOlg+LeiaXkKdscyO+xoBy7
	 brkiQYmgsIm+Ew81WiDDpdSns21110nQXHnOXfzH80rvx/a/NbV2lm0JoZfiDbI7bZ6ZW
	 Kv9jATnjOnIoXexrsOmA+a73Gu7K0gnWmnIFhk+tWDdCNPvLmEgNuEevDp3PCrUwGC1Wr
	 xdQwvTfnc+yWx3TDjXRaCoNOHUpd8bl6/dMckUier4iHBp4AyiCziZnZTEv+oEM4z9v/x
	 5bCeK+4b4PJ1RIHS3STRC6gWz6fwSAqi7OvqaheVzkhyoxaqDGugkZn+HVTAlvmLpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018616;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
	b=Tf1UK5YCQyzd3uFyoHNkwBvnxgEP1SFWSlwcxtIpgzlBOKC5kOVu38pV5jvrt+/+HQhq
	 PNv5cp27JSrn1+su0vMJh7hBDwCYE0AG1HJDAtxSzS/Npt2o/oiOiVsXMkzLkdTAOoE/D
	 4DgjQM1A7HyNp5OnnKKXg2QTLhBD3vYx/dxQ51C/qZ7AaNAq7N2FxdV63fkgjEHiRCjc2
	 2hh6j82OT2whHUrKp7o60aBXjNeudjR1x0bnHEpp6x3m7Di2yApKdeEfhNBIvPQdFh6dM
	 tpleXg/yl/LupQvPyeiqCEnpuw7jT8S5fLeEIisqY2Dr28qDijmSw7ZUKBU9UV7irkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpSRxbv0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hgZ4sIRf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpSRxbv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hgZ4sIRf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQa7q2227024
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1
	hHT20jpo=; b=TpSRxbv09hrbhgSonNLCOwk+MS7oGBadtVKM++L5ec7fAptEewo
	FVMTMTrDhoTtW2NO/4/YK82Ee7wiUbgSNcNz18h0t6fSQNKunnJ4dIp7e4O2NYBY
	37CN4Ry7FGuR8yn8tNVfevW5+Rwng9zBK7p2u4aZZOz51PJZcPeETcbsCFas/pDl
	hw5KRSFr7naDwvmfU8M9AghqD2YREEwyNfoDBaEQGVwCOYC6MzKftNhbrbLd0hSJ
	gfrIa6dnATeR1c2dRNHaaxRU6rb7rqwyIXZOaSxH/+E5UV+HelYZ+ceIjwH5Jaxu
	8KooB8qHBkMqfsf2w+VxT+og4RlV1MLXaEA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbbxeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:16:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so857193e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795018614; x=1795623414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=hgZ4sIRfBCwSHTx4j/uBdCdsZhRz72SlokZWFttgo5b9sTsgmArW2vxE7g+CtHhk2I
         U3GB5n6TXSei90JfLb1TEY9/t4Qt5xYzARXNIe7YwLpk7+JGldGLDApFMUHNfKBnQU3X
         EDx2g0HFWqjeflLMWfG840C9rYXXrGmjm7bIMqk1GEUs22+tHWU6L8vQ/AOa9fOMd1JZ
         ZlB3uIsO5yvpfvRBniItymMibsbWjDzg7dQumHlkVGmin4JhmG+UiCkxqXMe2wSvG72G
         n3pCJPQ3ljm2g61eyYDMcTReeEDkgrGV3d19ookQ8zbEKWdZh5Zd4xY+Ykl1bxEx/Arj
         tYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018614; x=1795623414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=VQQPWY7AbxxxedWhk3vzQ5djyiHvGlVzkF429IckXphkVnj2DDYd2tYCdFCJeYpdez
         pHPef7fMpr1gB5QBSwEOzPj/JLQRZ0qzuCbk0mMg1fhLpzl97mz55i2h5u7cBgEPdPH+
         tiLwl5AgrKkwt7N8yO53ccADhW5bYMN763D4/TEj0+wODBBuxSddc1bXM4IZfaWFxQpX
         +1PA6Al1hNYo/T1qOUp2scYZeZ/3qRphitXuThEsWvXCrFhWmJpsm6vjp18AX3WL2yW+
         vjtelygOZtQymmZLUtbZQS4Bx9VwGXAA36L9qgt3EChrlg3KHihWi0ENIxjx5NX7x4vV
         vJTQ==
X-Forwarded-Encrypted: i=1; AL+hErHhltn+Nd9lBT+yIcXxeulWORnTXCvrW3MDO/uzTjj1QhgKrfLLWKJFZX8ghN3Ru5nB/QMA/m+ddemd4ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+USZ21qomREHX6Rwxx1bb2WxzO4MWQICVS1rv9cJzo1XPtXjXz
	2Op7gTe1BSRy6ubWA1SgmvzxYLNeV+Gz5gTWFMsT/zqJib5iby6DNZJEzwH5vKTSIYei58yp4D/
	jA+qtLmk1H/ncrptSHPC91T7orbneALJ9evJBLeHUQOCikVeg8UNMBTBTxog16sdcSdc=
X-Gm-Gg: AYBFou1ZgjPH0c6oJF4EYUquItb2J1KIGFrqjMp8sGtDKOcEsSEuOTa2KJ9Pu7eH814
	8XWWj7LFpGax3nFzYsKMjSk+8FceqUCpMbiuFJuGFEjTu3jpL7v2ddwFbt3jmebHjBw6IeyeXSc
	TGhpZ1dv0oQlrYHOb51mHG9/WGvP6kkZmTUgbH2GUlf7KJKEjp6TgX8dWznYc58e7AK8PM/6rQ0
	zPuuxy4yOflviC8fKo3vtF9v1yuD/Cu7DL0PbkSz1SECEV/gWWh/Z7sfHxJxJr7kqylxNKiYKSn
	aiw4mTLdC0Yj5IOydZdozd71KMHH9eFYyj4vx9AC8X/i2SclMmQLv786iBz00orRgsEMsSvnIYJ
	SMHw5SxRirafTcGJ3rLlgY9cUY4iIiuPe96xblHhfynK7xThEHTUrPSfnIMzB+fQ0f1KRrDukBn
	dw
X-Received: by 2002:a05:6122:1d48:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ee646fe5e0mr1635590e0c.14.1795018613793;
        Wed, 18 Nov 2026 08:16:53 -0800 (PST)
X-Received: by 2002:a05:6122:1d48:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ee646fe5e0mr1635579e0c.14.1795018613364;
        Wed, 18 Nov 2026 08:16:53 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm217090495e9.8.2026.11.18.08.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:52 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH RESEND v2 0/2] powercap: idle_inject: Create threads on demand
Date: Wed, 18 Nov 2026 17:15:25 +0100
Message-ID: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: EegxlI2SofRlOmlAAKwbORNMlU6Gbha4
X-Proofpoint-ORIG-GUID: EegxlI2SofRlOmlAAKwbORNMlU6Gbha4
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afdcf76 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=x1L0ys6JoTQEvF2T-JwA:9 a=tNoRWFLymzeba-QzToBc:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfX3pVJbFD9Q1YB
 1TPDJrzK73smM36bMcRXErNd9pnvd7wSP4oKr7C9/RwXpgpojQSAJb6d+2cZjI9ExgRNUDMj2Tk
 S3ldz/46PFMpQFCAbwPYtB5e8RbLDGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfXyJjfX9i6tH+9
 GXwIx0dCs6V6zv/JriVaCVzA2BtSjolGN196Y8z/YVydpXTWRZWoXW0zE8DLg7Hs2jY8VCGPgKU
 fI/tynXMxvSKVJqbVA5GzIB4+ihMM8lA/AyX5sxbRZj4lst97epm5jfU+HRJBdTjT0HJluqIdcP
 WMPBAQkGxliGHBY5FeS4QM0DJFFFU7XK+bG7QUX23P7slmpuTdIudmDAfGUisB51O0NvaDQZbL8
 Kug06Cu2GNqDlluBCrld/hf09G1GmQcJNUKrCQPi7dN/+lZ4CKd53j0DZPj+g8HRLUxhf15kEQM
 kFdKKD7c92KHiY0pqliP8kFcenHgAD1T2E/SywbLWtHRT6u689/wQSgJA30pzQX/w5ntfnY83jj
 Y8LZ3RrJQmpP3d9QfQyEdGo/TIcEjm1UdGDJLY0ytfNVBS7E2nsozEZzOh4zgdeOLmbpNz/2KGY
 xLXwF9r3BtPPOQiVcLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180064

Idle injection currently registers per-CPU kernel threads during early
initialization, including on CPUs for which no idle injection device
will be registered.

This series makes thread creation follow the lifetime and CPU mask of
each idle injection device.

The first patch adds an optional CPU mask to smpboot thread descriptors.
The mask restricts thread creation, CPU hotplug handling and teardown,
while preserving the existing behavior for descriptors without a mask.
Registrations sharing task storage are checked for overlapping CPU
masks under smpboot_threads_lock before any threads are created.

The second patch uses this support to register idle injection threads
when a device registers and destroy them when it unregisters. CPU
ownership claims, registration rollback and thread teardown are
serialized to prevent overlapping registrations from sharing threads.

The series was tested on Rockchip RK3588. The updated smpboot code and
idle injection code also build with W=1. Concurrent registration and
CPU hotplug runtime testing remains outstanding.

Changes in v2:
- Reject overlapping smpboot registrations sharing per-CPU task storage
  with WARN_ON_ONCE() and -EBUSY, as suggested by Thomas Gleixner.
- Default a NULL CPU mask to cpu_possible_mask at registration and
  remove redundant NULL-mask checks from the lifecycle helpers.
- Use scoped guards for the smpboot registration locks.
- Document the overlap restriction and registration return values, and
  update the core commit explanation.
- Add Bradley Morgan's Reviewed-by tag to the idle injection patch.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Bradley Morgan <brads@mainlining.org>

Daniel Lezcano (2):
  smpboot: Allow restricting per-CPU threads to a CPU mask
  powercap: idle_inject: Create per-CPU threads on registration

 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 include/linux/smpboot.h        |  6 +++
 kernel/smpboot.c               | 45 +++++++++++++++++-----
 3 files changed, 83 insertions(+), 37 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0
