Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563776;
	b=C50SnvUxLSuCPlENiW4kh+B0brSFtHzpLvD2zVQoGHcIWSZT4v67uzothOvxzmLdBos2
	 xZubPQiHmhceLCcYHEdG+s090pIXcvzy4S2oyoI23eZDT7JmrzCvmq+r8yyXAJzLFHy/d
	 YdfvOSVXKYobcWUcuosv4L8XVJfwbVlle6Lo0lJcl7tF39EhyIQ5G8OoXLqASJPaeIjLG
	 tNXiubBkVihebCovnbM5hL43Drk4iQRVdSsHI0bzR4afVy9E2AsKWkjr4Wrr0BbiTv+sy
	 PQSe2Sdkwqp8dVoW5CtnYT4Cz5hUksIWCVcZSvWtxYWncKWZZTyPYp08kPD7NVlXwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
	b=jnWikTsKufXq65W+fbY/+TdHNrPuR9cXzRkXBo7xWr0fQR5fVEbnm+B/hNuDkR87anPA
	 4UhCy8vnCpwo8pbrLm9fPrk+LMIPaZHCujK5BxBLPmgy019bPDRvyjYSHP/FpeP+a+Z5j
	 9mbdERfkHhTnDOD2S1Nkq4pwF1Rby3NpBNeuHRaG5gDvYEWofirwYWNOgwx5DDFeWd64q
	 qZImwFfq87aTeiXLsV/kVw9a3AFsUA30JmwMNXhfzEi5awcJptaT4ww83o8RpLMzT1MfM
	 IWAE/GQvCwTpMoOerIuyDhjZDD0Y3HfR5JITM3M0Q4lrOKXjAwCfiDMeMFg/QZ3scaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96676606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96676606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb8u92288832
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=; b=DaYzFZsDbHmhOPgW
	ohtf7O2aDR3j1uhYhMagM5N5PcxjpIkbO40Pq7BnbIgf1e127zOT1h02zjV5U6GW
	xYvNHWfjdKIJ5kiai/qZl4H0diuC1W1cF9+cxzxw4cdGGr0Y+FnU73hxfeMQ7ESE
	u24XtZtnOmmihO5/z0C036Amck2Dw7QLHjck+M76h09mMjp/sWvVDHpl59OzPIsI
	OBnFKdD+8rOuMuRzP061C1SOynYs2dXCc66sqM0M3lbIdLZixX3j/6qJPEpc27/O
	TgMpIiOK9c01OVBZKoZ4hfpHhQTU3Im6jdupwHoA5gLKGfkIHMDj0F1TNophSXh3
	0bv8cA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9f60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so5481246c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563773; x=1796168573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=R0jaRQl0n2REaxPdpJy4m1Z7afJYQ5eOdhUiKac4OzFikfrv23chVNXbiwqolt2RUi
         izvgE8sAZl3i6ac2h2rrhWpNnuAWk1RnovP3cqV1fqsXFxyeytWgrwvYEkGI2983wxM9
         7+2Ss+D0/8BrP3CpMvaJ42zJyILbGgk5INAz3EzjnAVmR1yi4YSTu/EUE+qMYjtUy29I
         30Q2PaplARbfBuCp2npyFg2JKwL9Zyv4Rhtp9RWnExszYh6ZViU3IbL11jMX8U+pifS8
         JZend+fre019BLna7kf260Ff0d4g6sky0cwKH04nRS2QVD3HHv2mYbBGBsv84wHCm7gh
         jPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563773; x=1796168573;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=hjZeUeb0PZw518B/IQsP20NHn3G8pAG1XpIb5H63Ft7XuXlPehMIx+sZ5YXY3cMkC2
         kJU7r5afKVDUReQnxQqK4+pvvLKrjGd/tZZUr6z3iItF2Tgxxf9hC+EL1wVOtF0bn5kC
         j9iJAZ0xnF4PFrBoaOufjerLeW0IJyq7drCmHXBR7EhaBndG91BxCs6KUbNu/ArnToKX
         qW9cjjN7JF0/nDuQD/3iy8/mzREYdoTncZoa0k3jTNLwZjvM6JL0/Gcq6fpN4T0UQ4KE
         tWMtNQDvm8m0MZ3QHIYn3thwbHnpn3EHt9ILwZXXlH2e5UCkl5Di0aJ5RHvWMdBqqLu9
         2E1Q==
X-Gm-Message-State: APuU4Z/rEg0DQuiOJVrgYiy3vi7eId0s21ZTZw3AhyFEw1cbD/z+NhvN
	q+nUwx2ibt6/GrpBhXw/OVcQdOYrV7hFxLDmWZqxVcIwEQ2Y1BYiW+unr4sqGsd+WL0AJkw7cJt
	Tye/VWyXQPtc4lYGxbN+ofPX5YesdMKkryf+HX65wKzId/4LIGGoRcL2cU8WD5KBx6xM=
X-Gm-Gg: AZFdTZeZNex9rd2GdO3kzxuXF6Yoqu+ZF6nZQamreuhW924POM8ixWkXmtum1XIVJIF
	liHHfqsb2+k1sh632+3jgCsFP4ZSXpntGOh54kIA9Ztw6RFtwT04v5LiklvLqJyBxGmZKSc+OjR
	YwJd1hqWY+UMBFYAvOp1wXGkZWl+aMw/mj7X510bFJqp/o+GbJdb/RGgoaTdk06eWE7OipjX0Er
	pjI0qs0IfsSAriHZn3g5TCcp7zj/G8rhvjtAGpgjgREEPUISP4P+VM/vRQuATWrin3gzTq209lK
	1Exwazoz0oQbZIC5KWU+CqxKctnhgq1izcFfJMezOKVkQ8svuhiuKK/31zXLRAQGbHbNfL2Xavy
	n0CNmgmAU78dcpQSC2OBAPNlhz7QLIAC/UyOrG4nMA3cxriTbCjZIFoRGkNVY7WOpQn5b9I+mc4
	cFfIPFQqDx723G/AQivtq5Gl7a5Jqy
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272375c88.4.1795563773028;
        Tue, 24 Nov 2026 15:42:53 -0800 (PST)
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272345c88.4.1795563772474;
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm61388919c88.9.2026.11.24.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:47 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261124154247.000075e6@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-6-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-6-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX+NBHNI4CoZy5
 I3xn2UgBr5s6kBzSne5bsbRjBoAqVk4dXb6Lf+mQzyrWcdrvE1sp1vVVWbhcvqfE8Lv3M631mxr
 ryJYKvtOakQOjbWlxFdCH0EsX6q4OXo6HkiI8QPiJbVUPoR6RC+hCyT0PmQ8zKmGkfXYZ3gufNZ
 hz2E7XxflhbKLYQLyUFpW8QZDCNty51PF3wbTA5QmQdw43r02rbBtifypW4tpczOJshXI/xKVP2
 HnOLQ8ZZvWryXQk+ZvjNdF4MxSSHNp4AGOM8G6a+L65grWJopewuT15nAu5bWIAuhlTiqesP1dJ
 GrX6YirZz5JFZn5WqSnjm6PB8ycQq3ekzN7l+sJ48fT+PdNygvOqNkSbegzuZLSRRo/+C3b+HpM
 IcVoI0FX/UH+825IQFvu8tWOnVGWOeRkUi0HwDO5iAR4sZRzUUH5OLw1AM02c41/IG4UBcSqOd8
 CjGMcB8Onp9M9ekme4g==
X-Proofpoint-GUID: octpYWlFIwYfKene8J3FYlvOS717ykmN
X-Proofpoint-ORIG-GUID: octpYWlFIwYfKene8J3FYlvOS717ykmN
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0620fe cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gAdJEDVPSiZ2okViQt8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX0bWfhHawwALN
 9ulOYqyeNCuJ2l3bVSKg9kBG/SF/PxDq9j8qlUG3B+Nm8Dk1aRn1Jpi/ncHiRZmUdogNhwQ5Ecg
 8iFw0qMViCGwwAjV5r9FlMICzCZniUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

