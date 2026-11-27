Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787736;
	b=osRjkfdQi76qmEx88FyPIwFyNDTVaeeHQZLtSzo/UdVp5rdkWUB4UyyqfN7kgEgnaA9h
	 hDe1rDtpRMRK+1k1yI/YbY48wak74Hadh+uxZEKZ/wiszzvOYAj092uS2CpkeGfCacj+D
	 E1VmciXM7R4/6WpVvPeuwcfikifyTgnbD8AXy99fSNuZ5agojUsYN5xW+upOMub0pWN3K
	 WyA8b2GHwMqpibP1dukQAo0MqKvjOfKDnhHs8JhlM60Wj7nZDuF5PbTWCIFcLbNtiqJpv
	 SF3hZ22xTlrBHpO0ktM5QMGYYfSvYORiwfzgdy8isFgZdI3WClUl7B+4N7eGEJLulXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
	b=5FxKlY5XDjiieT7bQA1hcAVKgkl1lR4khyCvpEi+JgvuPE1XCMUq86ufVKgfvBWNyk7A
	 jNysFLkp1mKLFSrhYr+McMikj9RUy0O7WyZDE2lHuyMjg+8nmFVhbSG2rQB0wi0x/T9IB
	 otJSiz3Mp8K/zCBTcZoWmFnyC0HoUUncorFO8BKi8jKRKN3seyxLA0lTeKX7jlMKkFyzI
	 Ii7vhp5Toqg028CMkXV95kC3CfpPs3SXPfKFsS3iPM9t+Z6kjjB2TaqmKB8lTr+sgtO+h
	 WoMd7b1ZV+DZlZ74lL0XamyNypwNMkUNjvkwjTfU8gK2jnCbLtrMPwf6ZTUn1ArHwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCIsiBj1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRJmt72H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC63D606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC63D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCIsiBj1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRJmt72H
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChHon1620452
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=; b=fCIsiBj1dAFnx17q
	0e8g4pAsQFToDktVqgqG28sY150BG7zfC1/mAMWa/OfpcVsCKi8GWH4/UiNKE4R4
	d21XuPqo1OsnKNtfDnX4vhl+IqnMtPFHgTg5sRH/wwL3GHV6CVOJH3GDgFoU/zDs
	4KSuRCxK0OVGXPnkNjmVkZHL+t3fdtROE0B/WuenYTUKWfi31CDAF7bi3hmfHNkh
	cPr6dzwAo353SC+yxCt9P5XG/X1oVC9/RLvLdkFnaeuczxrKXz6RqbIZ5H6tNpqn
	A9q/GNLUdN4WWgum/VLcYT3GZKWxIsiqjPyEtGk/6/dOIqEonFIgEbYCeCCBES0g
	KsR2Ug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3atd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:55:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so11702718eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787734; x=1796392534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
        b=gRJmt72HW4N3xXsOyjnqc4tAn0wZKKReRN9M2WZ8acOtS/+cwoy+QHx4NFOgluGCkd
         agov2uhR1sOfmn3mdV6xThnQWZ4WC/qx0sgmHCWSf1u6x+1SKC9bTffoiAVRxbMjDC/N
         6MGN59hW3B+g5VBV9C0FInIgfASsEp4gcLjCrDSOk19Xxm+sUyOAMPHmYxBqq3eDTvFA
         f6T/soT6t1JWW6a5aOwzwBzBIMF1gF9sRgkgTroqCNA/N9hYQZ5lOpUFyjXqJPiH+1Sp
         O7nGgpDVEx+5accm/PpN0XDm1IGfFwXJJWYCwOwdgF3SQxIJvN5dThDnfdMxyNBYTwf9
         avSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787734; x=1796392534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
        b=URueOIxbmWjmeDSR8ZjhzdamUAYhvvqL7cQ4lRkbdIH9cEhdLouKemRM9yMo7u6Vj/
         efSdpGzJPSACKytAAE+VBuS4PwuGqlAsgFMa46043U8QFkz1Du9ZNhsxNnELtqpFyv2y
         At/yLSlQONmbDM7xrbY6mx6fpi1U6EWO3NHH8X487oCYEY2ekidMxSsflgLb9RJv0Ag6
         i+xMf3zs/iUjjbMLkiClYzDzg0+TqZHxOj8uafGvCMba36qpFDCMUFyeF8Wn/pSoY129
         2uxjtgR0m5dOPk2H/QSSOfVA5zTSremY3UW/vuH6I07nzVm/YZyRrYeKrE2SeUaH9X7g
         y9Eg==
X-Forwarded-Encrypted: i=1; AL+hErEVmSsPWVfA2cG28bsSrpZ1No8aJUOAroiQYdY8qkR8vR716vTOHbCDcUC7oXB9REwSVIoUuuMlUewL3T8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+KItnZUYTxpoLyQJDKb0fdMyzBKMFRGiiBLkcFai1FNMKt0rr
	veySvgXAFWnDlv3djo4tp0yxTvpfHo8MVdKEzItPS6nt3qUZF77BDQcxfvw0WK8IeCUpapC5KSq
	45qTLncV9MDaUbOW3iBXMVqP1QUPSnJFi2241MTEvpY3GNta+k5fOLfs6CcSS3vGP3qY=
X-Gm-Gg: AZFdTZf5MVIUF3f0R7CsbPFIgbPJ93cIUtGVV3dk6TKeX6A0ReVr8TgHR9aAf71kCuy
	a/+X8zewm4QulXrc5U0luyAJKD5CorvPVQJ02+PJkq2MP68yroGD86JNJMjYzdCnbRiHQjUcr7n
	8agbLzoJMDOifCr6Lj7qLK3ecIENMhuYGG7X5nFTVWo9Yy5hN0pgq2chY+griPgtRZbw7SU25L2
	wrtzuE+Lj3JumDDzIsZLL4095W74YeTxnwfn8ORB3HdvgPLPdBN7jjYhLEa+w/wMjgR/08+BpV9
	2QsCXuAfzQFCsyfmT71OudfxCOkpPTPKVQ0i9l65wTPS3cm48J/XkvMOpkf07A9gkps+NUWwIa+
	NDoh1GMlC/Hwishzg8pdpqdJp/QEQPh0hWaw3DFJvpVdX6rVpQT7a2nOHmBLLEYj0FI52jKkH0U
	684QRi
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr15267651eec.13.1795787734071;
        Fri, 27 Nov 2026 05:55:34 -0800 (PST)
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr15267622eec.13.1795787733548;
        Fri, 27 Nov 2026 05:55:33 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm32534281eec.17.2026.11.27.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:55:33 -0800 (PST)
Message-ID: <fdb8d9d2-3478-4257-8a61-1e8de6274352@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:25:25 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b098bd6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O1gZ55P4O49W-73hC6wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: C4KKDMdI9UJByffSKlxid2unUJ-XFWGe
X-Proofpoint-ORIG-GUID: C4KKDMdI9UJByffSKlxid2unUJ-XFWGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXx58Q/4DuWSY8
 qTScXiG97ybblsHrmvRjT7cp+Bt7kK3l+ZNb0Vm2t0+LLWx1A1YLuZUfDO8f1cdD9jjIX2RuemT
 OvUQChMjDVAUE1+XEVwlsBXBbtPhHIEA0YfAGhOaIZNemEnCV7tFV95IMofAF/Jt7a5EH+zV9FZ
 ZoLIUOL9ts5DnRmfJ0QRAEMXrRerrq8/NspASDWEmsGETIXgR5vpAtR0JBdxTAVcvkTvKAjhcf/
 2fNtsgKDBJ8HZtQISDuyDhrZxwPPaReCdubBbTh948700CkjUfr1qNHSOBtd2+5XKusDkYm9Mgb
 areJoEKXPXmeSMmL7+IPTC0iDc7eYQlb0iysBUcFDR21ePnpzQzCQDToltTuhQHYQlZzjUXj6Mn
 NdS3K/yem3D5UdnxHSb4irQxKim3ysI4EetWO84x90oMUmM5fjHDelbFj404N4C2ikd/nE7iAc5
 vkcpO68Zgvz7vp5ihYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX/2gCGJWRzwBe
 Ivp7vYZfi0zXWeLVW5gHck4XnTKS70HCLuTdLSzYwi04ZAa7IlBCJCWTTSNfcD/gDaQNOCehhoF
 szNL+o2OTdsK2Q2TT7uJidvAU/pIrH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> iris_vpu_power_off() is always called with core->lock held. Its callers
> are core init, core deinit and the runtime PM suspend and resume
> callbacks, and each of them takes core->lock before calling it.
> 
> The threaded IRQ handler also requires core->lock to proceed. If the
> handler is woken and queued around the same time power-off is entered,
> it cannot acquire core->lock because it is held by the power-off caller.
> disable_irq() waits for the handler to complete, resulting in a
> deadlock.
> 
> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
