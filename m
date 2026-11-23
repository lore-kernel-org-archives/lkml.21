Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466413;
	b=jnycFIOvjfh1CQ8szq79G/6hcxO7jUVC4mgARIeL18j4O2yWRQxHrBamJMfriDw27803
	 LoSKNVSHOjxBYf9HsXnaL1C7k1oWIlbr5s1Byf2YZMNEpkOb/mAl+cF9KhF7BTeJmob2t
	 zxrMkaiKX/LPs/jHqQ0z1B974bkYEEftJfg1bkevug4+v+PhFEA7P/sURm85ViWqYg+9I
	 cH5fH7mpK18e6eYzLj78uVDDDS7ByUYcbYRlJSO28mB1he120qulAlMbKkvkYz+PQuzlD
	 +9oQRfEoETiyBJxCqV9LpXy8u1phzngRojB3M8Q50ljCCDqY72bajak3Z2c5e0Hb4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
	b=z4cYy0/+Yauvqbb+nK1XxC9K7HIC+wy0T2WiIecmlX63SRkZRFANyoZYKN1dy7EPlgNv
	 FS5P2ONzmBRctvblYj4BB8/8Vj23uhoERndlHdqfpzYioeCAA8tXPlzykzQ4uJcVQwgn8
	 pR6LKdzfqJZbJETeDFMcbcTb+OTHSUMxvM/stWWC9RlheMFAzTn81kQwGn9QtWO0Jeu72
	 tenXLRdvoyv/Rxc2TYsUfYGKK2m0/vAsG8qBoWwpjClTNTVQfb/t3VZC41A/YKt4vLeA7
	 vruHmad3hq84lan8bLbr9+DGxpZSFe7Jesp2Kdp+RS4+JniUavmlDMGJfsJZ9TGm4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnBgJwOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw3scgOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AC606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnBgJwOg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw3scgOn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuqOD2862149
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7PuijnsQ8tBYoL70IAxVi7X
	WsD7KOhH4OGNYUBfaVU=; b=WnBgJwOg453GEJCWBKdoHeY/cF+Hj++nt8m85ZPK
	a9DPmCxom/SwOl5iZlfu4N4iQ8JcAmmQbrZj50iiGtqv3vAtbnpbd4JvqhJXdCeq
	k9yxSbNa5IQUw1L23wrgtVIdydR6WhFvRhUzePb4+MbiTZiT7eZysKIncseC1djV
	Ch0SqkDenUsZJFeFIFMBzoJH3F2j8cKoF17ITmCMtzT5wCyfCDqeEtEZH7jZhVaD
	LYe68wLptLJ0+xameSioi79K3WKWsjhDkoGN5IxVUY72ikDmMyJJlQ8ol0l4k4+J
	uPKq68Rh617/0MtAHEau+JuOdR70YS+Q8OvyTY8GOCAHIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utbpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:40:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so680749085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795466411; x=1796071211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
        b=Xw3scgOnUzJdR/+OGgiguVjvKwtfvPz89tK/AtRGR/M7GYbDd2AqfNsgjGlpXrafTl
         FjvLGyKUjYHaWYLlnwL5cdH8Kgu7K1vs8Ymq/ck0odRTgR3b9byFmtZwIKwO+iZNJBug
         PgyiY4dFEUZHOaiBcBmZsMBAFrjctHqHl+D6RFml8JsOplcAg2LmZ0c1ChjXeJA9FXT+
         CAaWOGOlkbcA+1Up5BMwC4o5JyrY6fZOR5hfsOdv938tBlLd04+mfev31wMBwEjSqTM/
         TTngJsgvkdPV2SHUavVtyermhABPAegu/w5T89D39U2dIWv19k40TrOiQM3494GCcttv
         +/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466411; x=1796071211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7PuijnsQ8tBYoL70IAxVi7XWsD7KOhH4OGNYUBfaVU=;
        b=DQNfAK4BewRl42CV3oqoTi1gnN2d/MApn2ZMzC2bnN0zfT+VsHle5XEp7d1ZB9IX7l
         n8H3yxSCaS/DAasxZEgakHQwhce9YEq6dzbDogiIXKf1fa0UPGiICEG3VvqNzfWs1Sbc
         xKllZP49kZhk0J02wcYsS62pd5eZupZ/5JUFsMaiw1Z6u/3wOfS76qS/czoVK8eN6HRn
         lD91sdpQuikY2oEgKsN/8avB1Knx4zaalA3en+0UFkc/jtTJX3ClOpf0rOe4MUUZ0LLa
         7OHpuep25b8TCM7dDZJpBm7EwIYn6SjF38b/BcyyvJ8Y3vIfRIXge1iOXj4ZCyp7i2mA
         dMkQ==
X-Forwarded-Encrypted: i=1; AL+hErGTBRb5pk8SvjgfLfrapcDtn06T6UQ2gb9RaJIRFEPkeMn993c0Y4MdS4U8wt2qL60H53egWaM2RjOCV/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9opD+iO/nqmXRLC7YjavDZp1TAi2/LqNN7PxlhDI1WuKU9CKXR
	I3EzBxnJOZUXNY7k3zqHT4UiFUVQSWiFFZZj3TK4PeS25hKVcx1l4R3smw/FjflR7NhMh189mUs
	oYdTOy3UfDYrroxi4zsdAfzlQY/Ms7+2Emiw+NowcGwgHvnJ/Npi3RN2DISBSlNBx+T4=
X-Gm-Gg: AZFdTZcUPUrch1io27hOhgX4CuExTe2mdRWkDvyjtdeQ2kS5l6HAxZ6TGkNV072UbZC
	zCakPBr3/gRYVL8ufuq7LXpLqlDPAJ405+5SuvWOEc5Ad4Gwscp+zXmvPRJavf6QK7ku8bu81Py
	9qMJH03t6/5euTB9j0l2tATUHyb+Y8CEMlXCYLzW8ine0M00fCL3R9qJmlTwYR+eBPFfzcI1KeF
	L4pv+WXXSFSYMQTgSJz8EjIPgyWrEV6ugQntXL89TlzzkM6w1Xc2VCm400Mug1dxMxJtrBxHU//
	coI+a7jc9rU2SsTJKE/D5NLP1ntnRdKQg200Bad+bjDwdswb2YS9gsCEZx/LWAO1AH/aMj9FfQO
	E/pVz+Mb2Jd+xJ6zd9iA9jMBChOZ3sTxKrBLIAMbp1YHFzzHQuDhfbnCulEVVpbTN
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr2288599785a.3.1795466411339;
        Mon, 23 Nov 2026 12:40:11 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr2288593485a.3.1795466410642;
        Mon, 23 Nov 2026 12:40:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm22561824f8f.34.2026.11.23.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:40:09 -0800 (PST)
Date: Mon, 23 Nov 2026 22:40:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Fix use-after-free on timed out
 blocking requests
Message-ID: <d4zzqrljfmzgyyahf6fkpxvh3zqx5whpvnz2q2456ym6o5mkxf@zsmyjt36brhj>
References: <20261102-rpmh-timeout-uaf-v1-1-f1fe9d38f1b8@oss.qualcomm.com>
 <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50103867-1f03-4346-8174-b7301ba3ddf5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cJhHaxnRJxxb6UvzqoxIl_ExYAwlWjhv
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04a4ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Vw1ili4nxZjTFdjbWr0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cJhHaxnRJxxb6UvzqoxIl_ExYAwlWjhv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX3QXtTrEDGc13
 x3zt/hwogHqrE6e38J7lEy26M/+4ZtsxBwllB85C/gbuxMe/Qj+vxCvVJHqNLCzz3R2WJTYYFZ9
 e+F3o/PBmVtds4CghXbNZwTbMRAsdN0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfXwtPwrMwvk+l5
 dV+xsMaH/qX4GRErQAm2oz6S/mq9ZJD6+hOV8vP9q0qvgEI70sACPrgbeu90vI1CO3F40k5+59f
 MyFCYaLzgwOcD41uNbWzr1UN2vB8kwM9QEuH0Fz85cXoxXXqUKwfhjUoze5BIOJs02hiveUP07r
 p26z+UC0EVqPRbbLhnfCE4cpRFaKzkpzQDA3DJVllxpipr3MbXMK3fEeAlPtGFo0ilrXWza+Ton
 c0sGMCYmErJrDt/5Uhpo1YcKw7RB35b7gNAcoicOl3zKCuNYcnSI5e/CLRcXtFga+frFljJFMtt
 KNL6QKiuWYEX33MNxfl0xTso1ds+DvHpVL3pPyg4IoEsiFeNs/Gw4boMsaNE+AZo8kvavWLKTNq
 6vkvvqwfkqwwvM4js2CerKeOMeKnzrGnTt2Xw6JEDg1HCJRTUyBKX7w5HJPN9XI3L975XAHMAcH
 RaEEw1oZ3ENnTxfmEXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230082

On 26-11-13 10:03:32, Maulik Shah wrote:
> 
> 
> On 02-11-2026 16:16, Abel Vesa wrote:
> > rpmh_write(), rpmh_read() and the ACTIVE_ONLY path of rpmh_write_batch()
> > hand a request to the RSC controller and wait for it to complete with
> > wait_for_completion_timeout(). If the wait times out, they return to the
> > caller, while the request is still owned by the TCS it was written to.
> > For rpmh_write() and rpmh_read(), both the request and the completion
> > live on the stack, while rpmh_write_batch() frees them on its way out.
> >
> > If the hardware completes the request after the timeout, tcs_tx_done()
> > fetches the stale request from the TCS, passes it to the tracepoint and
> > to rpmh_tx_done(), which then signals a completion that no longer
> > exists. For reads, the response data is also written into the stale
> > request first. This corrupts the stack of whatever the timed out caller
> > went on to do, or freed memory. rpmh_write_batch() even documents this
> > with a "Better hope they never finish" comment.
> > Fix this by giving every request handed to the controller a reference
> > count and by embedding the completion into the request. 
> 
> I would prefer to use BUG_ON() instead of WARN_ON() whenever timeout happens
> just like downstream does rather than to handle the timeout cases.

That isn't an option.

From Documentation/process/deprecated.rst:

    BUG() and BUG_ON()
    ------------------
    Use WARN() and WARN_ON() instead, and handle the "impossible"
    error condition as gracefully as possible.

> 
> In cases where interrupt never arrives, already HW is stuck with no way to recover,
> so current implementation of having a WARN_ON() and allowing to continue to run
> will eventually end up in BUG() or crash somewhere else.
> 

The two things are orthogonal: your series improves what
gets printed when the timeout fires, this one makes sure a late
completion can't corrupt memory. 

I can rebase on top of your debug series if that helps,
but I don't think either replaces the other.

Thanks,
Abel
