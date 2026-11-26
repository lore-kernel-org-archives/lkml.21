Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680991;
	b=eNWG4VcdWp3Vgzv+IxmlGdvX1oYmG4H0vecuxH+nKy/wpGWTjIUHs1gNddEEBmaJveaS
	 81NtEBSP1qAj2onx1ARX/VA/62jkF/viwnkDiB0QcOg+uvPpullhZ8A5qs0turdejbGqA
	 EkmjDcIPY06cqxRlUf9XvZf05t6w6dNSnYmNfFwuE23uAhqXkVb9b5Z60JtP7iO7Wg2S0
	 y2uwR3CdbLl0rU8feHzFgdmZk0d71thsJKhdB00tlrPBCGu7okiGfLTSDZPZZ+y66MTdA
	 bDlSLh2GGeJFv6qUfR+5Lzuv/kHajuH2jpbZqJJheTe8WOjq6D0wFr3hm0KahB1p5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
	b=5UFfAaXf9AkNK5clkRFaMSyo5miusXHHq/di9ZxasqIT4j302L+nVkpB9Zzcn5sxU3q8
	 LiR6P1lCCKaJ/T0kP1baIWxnh+k4feo+O2/H4ew7xJunBdZCNtI+Ifzf8olwEJGNTYdCZ
	 RTx9TnRFaKQ77HkpYiuUHJuj1SPDnphox7cLwOBzqy+RulBexAR3IUAJPcMwD9aoOClrZ
	 Ke8qSK9cyWWj1fYj2j4GKYU0KvIfjK0HFdWAoGWD0edDKoxEl9Oxr+YDbeWfS0yEGTXQ6
	 GMsKnploBcnNwSnqkg5hYrsaR9JO41cnBMBVQsGtWOd4y1oP9YCjbyD2223e9K6AlVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9Y1lsMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMeXZzUV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7218606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7218606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9Y1lsMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMeXZzUV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j3Ll132104
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=; b=B9Y1lsMKHwnmyDqV
	Qocphua3FpMjdRo3xNMKZbL5Df9gZ+Zlo6R3IwOAxBszc/Mu2lH60OagkIzpsoFa
	Ay72Rvv4fvpENox6mW8KaETEcGg7bjpMMc9bue9Nt37A+r2tBHL2Xoy4gqHzzxzT
	J0qJFpuE08d1NmgqkUGcUGUU5KN9vKLPXYNrAj3yFCfsGyCI/Gdnf1C8r5hAV4ld
	aXrzVzoLitLT75NsXG/6QYVc8RJenjq/GFhqD9bvTIwB1k/doBQDM5Vgr5IPnMYY
	rVaieTzvNYI4Wn+0+ajvv8Nl0I5IvyqUvNqVCc4oj2NbW9wboYaPuGqT7BDtJmVv
	9bV9Cw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne03t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:16:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so4230981a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680988; x=1796285788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=KMeXZzUVb48q92a5u42a/4qKpQBja5dzvu1qqidcuC3KwqRyGyAXKBmgYdQv4F8tGJ
         wfLJF7tSSMJShTyZkosL/gpgULPmkGDx3hz/QpCRhAmeua2EV9lbjT4K9MsurfErzrFM
         Kc/mZAclUSTSWryQgiFvoY3di0EKXOOUgh7iMHYIeBjFkduCG6GN2GrZHWfrMLtOHHIL
         PuPI+/rEk6wxN0FyallbmdXHQ77fEFDu97b5SkCYpwmtUXSwbCMIUCU0xMoCoMQGpQR8
         b8C2G8WMkwdhUbPQHqgKpZfDSFHPT/b8O90BAidIzs3c47jiJPYcqGZguS6Pauho3TM3
         a9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680988; x=1796285788;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=NGID2kn6Zlj4XfDKakDmammnf8Ko3y9yYm8SOH3CZddN0zrCDTEi/c47u9MK9kz7J1
         lzSOwH4icxm+OmdjTCkx4zwcWG28ftJowAfUmedS/MY4OH4rmOeIQPfF/VTkOllRUC+z
         4aMNNR1SJjaoZk+QDK2L3DliGLOEsW/suCBQntLbsZTpMm7/SdE+T7hsYtuTbxcx/iuX
         m5Ng0tAfq2zQWvhp+9yrk/SN4h1yl331shnIrAonIXuU17C3BrM9N9TnQQNbV4qJLM5A
         z5FEe/YmK1faAe1hOiAhSNFJUwItorlh4C6T+nN0sQVIW+X7Nd3V8CiJZlxDaGCMjonL
         zPQg==
X-Forwarded-Encrypted: i=1; AL+hErGgpmqSD2IEFFzAbRIyd+3zJsh/s1A9o+8ArqbBvPrxTqh8Cuk+TLhyalpn/VIaQ/ivcflIemqBBVbNw18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/kVenBG3ze+7S+UI3xmMeAeHjKnzZMzp252ovG16q5Ebgy1l
	3Q9mFMOkS+e90za9t7KtobCQM/oAV6hOtVJwO3B370sBkJEj8k8KHFnYxiK5KFLHiIdw4xp1YQN
	x1n4mbr06mRiH+pXRJJBPvSsveNA676S0lHl2f50rjYpqAyGEHItXQm6lW9taxHO1w38=
X-Gm-Gg: AZFdTZdzU8jdIKjOVujnEQyG41VHBRNu28UGLDqluxRDSjq8/dEn+FB4OW+KvoDLtas
	xjuedAzyUqLLUF1t2wrM896hDZOrnLJaE5I8G0HCPH8cFkCtkkYJq73PH5ocasDaBqKvfP3vtCh
	1ilm+WFVGbHYqr1wLMalOQdxCFdIBUJbXV4sxtWcmJJweYyE5pG8YRViObRIjCSx1X3FIxy4A7E
	NbGnezs7oVZuBlxzN4RFe1tckLnSEWU4DNFUpoo/6qbDqheAVNAxDuGo04spvquly9XPROv5Myo
	ZECqwjfY7d1SL3I7Kocwk41wgJevuCRZ2IoLH+qbEySKOcvsgDid1QqPzGQDiC9YI/DMIq/Lbv5
	jvaQ93QskoyDLcCNUWkkljTVF3sjq1jDdod8jGir4vKlrUnPj5yusYfpdSwZUgoStR9DnOgD7Sc
	umGn3y
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875747a91.19.1795680988383;
        Thu, 26 Nov 2026 00:16:28 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875722a91.19.1795680987817;
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm10713182a91.17.2026.11.26.00.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Message-ID: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:16:23 +0800
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
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07eadd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKR0-_iPvwzX1PQTlCgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfXzAiOGx0EG9Vt
 DH5WknWWQPsBuVFWzr0o2pZ3O+FBzSnXCO3zrtHIHrW9CJ7qKDSupdLBYnqYZEHfSGKApfyTBXl
 84XqJ9noC3PMRMUAiE036CMKim5W0kZW7k5nIRnzk26Gjla3zSew+xpjOERAr7CCKxKKc+lENn1
 hgNiVLpwgh1i5eQ522+OhDFp6fHpV6CsrDZn4L290aWbj+VSW1Dl232i1wi4l5UUmq5WIXgDpoO
 9Vbv0mATjDpkY5lIUVAKMv/SqJcwixtZhN9HhJs8h72yB5BJXfY6XsHUuZ7How2hg15pwouJcaV
 UQFkSjqNkvp0lE0rr+n4gBgIdJw6eBE1mVVy3KcKzYrngiPj4LQ2k2P+R6Ww2zRiJwU0g7BvXmw
 RgLbTp4/Nr4JQAbAvy7QzG7TzQ3zthmCJxlupeXWAX2tnoOcnEf6hajBGjWMFx+KJ5N2AaiRR/+
 qJvcpGd5TzG5D7/9AVw==
X-Proofpoint-GUID: 9ZCIx6-gBolrgdNaLFNJ-T_CdIPYaCOO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX7PlaAPw8wUei
 KkH83cWziNuQdqNWOuJfby+ER+LF/XNODRo7DwqSOhcEHEOvv4o5YAfKXaSH49ev/vWLbtpZjW2
 5jc5wM6S1XEj341Km6JkAq7GfWhs8Cs=
X-Proofpoint-ORIG-GUID: 9ZCIx6-gBolrgdNaLFNJ-T_CdIPYaCOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/20/2026 4:41 PM, Kang Yang wrote:

> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>  		ar->state = ATH10K_STATE_ON;
>  		ieee80211_wake_queues(ar->hw);
>  
> +		/* Cancel the deadline monitor first so it cannot declare the
> +		 * device wedged after recovery has completed.
> +		 */
> +		cancel_delayed_work_sync(&ar->recovery_check_work);

If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
has just recovered. The sync cancel only waits for it to finish, after which
pending_recovery is cleared while the state stays WEDGED.

would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
run and the check fails, or it is cancelled and can no longer race with the transition to ON.

> +
>  		/* Clear recovery state. */
>  		complete(&ar->driver_recovery);
> -		atomic_set(&ar->fail_cont_count, 0);
>  		atomic_set(&ar->pending_recovery, 0);
>  
>  		if (ar->hw_params.hw_restart_disconnect) {
> 

