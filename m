Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749833;
	b=aRhtbY6HEHBJwIeLTrxsNKGgtiR85LA4m5f1DCFnspC2GEMSbxkLFtUn9sVZby0qHdBD
	 vrZQwVWXrQzv4xMAeDxO7BIlC6udtQVJtt69Vik/Vq73ZBdIBvHoepU7+ae5pkoTArn50
	 n65rTb3xSzYRVQhE3rtWtOd9v1MeNK7kKLhbo3jTz8O95eCsaGctKD3xttMKDFEjHZ+/V
	 Mm+0X0jv5SXgwmS7jM4RAncTA3HXFBdQGaFbwtknzsY8ZYln3h8SF4HDqqDTtKc7eXzmD
	 I8F+fqKG3yp5wkViydZaCMEM2EX1ZazjaFcItnLa2cLIX/DYDH/TUBl0ls9qo4m1RpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
	b=RL81hw1lLj5sYLNPh9HaDiLcL7Iw3GJY3qEPkil+cHKhbEtb371FuOKcApCQKRylchMv
	 +qho3o/NnvJ9LJUxP9pMlPfTD9RuweUbsRZwKjsArR9DVGr5yGRJBG5dgjrWN06c7s0/i
	 rKjOOt5/Tb9X7juXdAMCt0ayH+Ujib7h5L28Jqb/4ctq2ClyGxO+mOdbID7a4gKeC/zCQ
	 wUhCA4+vmIkKq7PpQnfQT+lkHW5eu44WsZmPCYZq9HKoILYdNX3zr3XJdmC6Mr/7COcC/
	 FbBGEt1QpAR38r+nqg8+ZN0FkzFgMrRBCI/ZHBKoW3Ershfft6V6HK4re2MRebxWTsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koATYJk3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMBat1iL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koATYJk3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMBat1iL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvwaS3864039
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=; b=koATYJk3/rX/ewj7
	qWLcpwItkqMWctzdXuZ54RuwEHZV9Bgzn0dujW3acefewzngXypbV4VsO9vlwZ05
	zfZnQOp5PpxhZc2++zZXd5hDa+tx7Skwz552Nl4jfsLAae7+hhW2Hl9fX+kXAP5I
	JkNiuDbRsnpGUo4BOEhI39qbOVJFc9Jm9jpmUVf+9nrIMS+qgYVY2rT0lMKyindX
	7ObMCOz2fC3p/WhXYWacVRHQRduszajivkxNVWLq8QRJlTc68enyPC4tIr7hfJJu
	U/HnXgRRtLoobI0b8qSf8sLTYbVs5hrXXIdyokJ7Zb26Ddr3fKAysIm3knhLM8KS
	P7U83A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ryft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:23:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so3975139a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749830; x=1796354630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=KMBat1iLwL6I7BPHgoNYnUh/+K44elA5xti1K/LjK8dmqGmXvlynT+77a332Ut0zNE
         1wtoREq41Fqh0NBdSjEx+n4CL0eWTXlody1I1eLzsSvbPr0A2Z0gPE1B+lc4ON36d9bl
         zx/1hlD5QkxERaXqGpm6naZNzE9RpqPleAKEFdQwQiyp6CXWOjfF02T3LE7UOJ2bwh6e
         AeeQkN/5bHZC50gMk2Zt6reSYXKBuRdAb4aLiQXWE+sGdF/Op8k31q4ik47T+GwokLJT
         36yv453MzzkMLatM/i7yCi5RGE7Pz5qR9HuVbI1UL0sN9Uy86ihuO4/HSm9rsvUn8zpC
         MTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749830; x=1796354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=WjQofFXdlMDYtaPzio2dR09el5xYvB31hbPjngz3tr4M+JLn3cSlVFFED/hyM+RewM
         c9Wfut/n02JsjI6GrEve0L2r1bwWHfp4mCW3Ipbhf+2V3F+Z0LviYudURz1MY2zvBJ0l
         Na4S/kOIxgfk3yGVGYl7rQgaHby9Zk+FiVr1fgH12l5TxzHiKbWxW3VUm8Ippax+dMEQ
         zFKDUJ3XmQJhEpKHSGJRsPCuzwvpFfgXnWyHZrmPTpVylBVOFPBxn6zwMGTL5dMFnEQF
         04T3l4LsU/4D4/6hLcfhxxs8bxWuL1csYv3my9VTDvWLjuQFV9pzWGRo7zUMicu+24ny
         Q2OA==
X-Forwarded-Encrypted: i=1; AL+hErFnFwbO5ISk42jHqI9Ydt3Go6d4uE1wqctEZh3n/5k85HNzCvv+UphMLs1u/kusfnj5DjlO49rfJ7I4xtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mxwsjLyPFPN3q4qjLmdauk+CZA59qAqvLGxARGThFIMFmh1Tl
	uh2b6+yEz4yg7lZ0SE6iIzeWbdQqCYwRPG7jyUycFpnhDGmCMW45m9+1xTI61UOeeK8fn1Y/BAk
	4DXnzOAzGkw8bWhXBxE0oQBv3aDP91c5hvxe8dv8RVF6goCkp0YMMYWr7PFfdnmIX+ks=
X-Gm-Gg: AZFdTZeHQq3xVoUt8QVkriQZDzY+2LrGFNHrchtFB83N5OCdguNjNMcyU4V4wtDeG9J
	5OpXWmDaWtmSTbyGtI/sztwJOsp5r+VS2/0IMfR7TBVCDxqD8YlUWA+bSGXz/ca3Pq3vr2/+eku
	Ga++QvqERE+3a8GZBFPtDbKGIa0pxP5bNfI/8aXmf+4opulSzIDR51FQeWh7eB99khAthnnqkNM
	k+ilZJ8JMp38m+ZcQNpn/EqAY6+nxuktsD7ikuOET/T4xctvQJBSzC2NmakpxDVLrDbalbMnnrV
	RAw78rv/cl8jv3ZOUPw7DNJJOmIZfnKt12o4SGR2WeEMBBvNFWEPWsrv0ffRfSg3yCQ9EffO/oB
	awdy9IDGHtaOgEbagu0X3HEHemvVX06mCazcPJ3Y34eJWUxnccyIO+IP8s0cc1uov4kiD3/yYnt
	oUsSNYk+WZ5S7FO6nfZ2KYPoTuuaRBYbNVS8xAmzqJXw==
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947673a91.51.1795749830460;
        Thu, 26 Nov 2026 19:23:50 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947647a91.51.1795749829999;
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm38187020a91.11.2026.11.26.19.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Message-ID: <b25a7fa6-de52-4543-829c-b4e1b8cad56d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:23:46 +0800
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
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
 <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
 <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX1XkqwdD5TV0b
 WApATRRNxoh9k/F+Iy0OpBdiREbQK1oFYRk8S2dx+nxc0PMO4aYcAuzosFMVLsM+orgI7eaX7D7
 53AIbPP6W4dPeLCX7sH+CHiMJGKBDDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX++eBB69EXZnG
 chJ69IhDOVQaQlDP6gRtzdhC4fkJxzVzfld8A/znoW6ebQ760kAK5KDyoBLg1HKEOLxv4aLbhzE
 mG6uuI1vXssk/+TnzFTWAH8luQbxKKg+RuzaeYf8/hVNass2UQlcqIIN7yeu4SvrEyZusGMnypp
 VuMAlNUkQiDtsRHxmSLQz+bqXdzCpzAeTg6flO+MTN/sj9LpRAjElcgEnNU6+r7p3KVf5wzO5Dk
 NMzVdrt1o6X/esIVIlz5jbXkg0Ea08CAhElhbiuaWRhau61N+0S+bD94J2gW83wZuRzENCG9Qsj
 0VAMSns6OdvmAwa2DAniqXXCvya7KVJLek3LiHuTBEhQ83xMBJCfcxewvq5caRT7qEankpMtMs3
 9Azj7aBYJbieXaEfKfcpsxebcS5K3i5Fsw6QPb91dnEklDbhdbrILLlyiso4+3U1nvKP9aYFoTc
 KdXjq2rXhOCFXJzyr+g==
X-Proofpoint-ORIG-GUID: J3Ob36vm8QynAmhDaDoV9o_Qr6KPWlEz
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08f7c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IQv86u3dUjXOA_Ac820A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: J3Ob36vm8QynAmhDaDoV9o_Qr6KPWlEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270013



On 11/27/2026 12:01 AM, Loic Poulain wrote:
> On Thu, Nov 26, 2026 at 9:16 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/20/2026 4:41 PM, Kang Yang wrote:
>>
>>> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>>                ar->state = ATH10K_STATE_ON;
>>>                ieee80211_wake_queues(ar->hw);
>>>
>>> +             /* Cancel the deadline monitor first so it cannot declare the
>>> +              * device wedged after recovery has completed.
>>> +              */
>>> +             cancel_delayed_work_sync(&ar->recovery_check_work);
>>
>> If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
>> has just recovered. The sync cancel only waits for it to finish, after which
>> pending_recovery is cleared while the state stays WEDGED.
>>
>> would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
>> of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
>> run and the check fails, or it is cancelled and can no longer race with the transition to ON.
> 
> Alternatively, disable_delayed_work_sync() could be used, but it needs
> to be balanced.

I need to use a fix that can porting to v5.10 kernel. 
disable_delayed_work_sync() is introduce after v6 kernel.



> 
>>
>>> +
>>>                /* Clear recovery state. */
>>>                complete(&ar->driver_recovery);
>>> -             atomic_set(&ar->fail_cont_count, 0);
>>>                atomic_set(&ar->pending_recovery, 0);
>>>
>>>                if (ar->hw_params.hw_restart_disconnect) {
>>>
>>

