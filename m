Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463397;
	b=OWJKSdyzasKp0LFf26/b21v+EJXxvJXpznJBPICT/GHxO5KseWJ3wxzO2DiViyh2s244
	 fp8oaXlh3LmkOogV0mE6b7SyLoCtgBLvXq5C+iIKpvhyjKVJoaR+RJ0R88OlSJFiCMirR
	 qOdAoSyslfReHWWlPQj2FbKucNa+1tXCEnPJ8jTYqU9ewMjXvtOsrx0Bex0mUqZ3y9q6a
	 Z0+xNqxWj/q7PwaDU+pj4xxVh/21bO9bln/77CRnGINOaGVD8tuv4tqXQCgka10+QGE8w
	 IL+KUWk4Ql93vx7sd90WPl4W1Aa4fpvj0Hr3q7LZuQTFO9+QowiRiaeeeXPjiT6Xidw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
	b=To0xWuAAMpjroWam/147Fk80i8FubSDcUVTIlzoH+thfPvAhYl5bPFINBBV/Nl4gx596
	 IrNKvKAsGM0n+U4q4R2DsOP1BGXCllLyyX38VxFRcE7hYdWEX4mm3sKFJQU9hKqicKN3o
	 VNbMZY68x+a0k9s7F9R0Kgwy0JVjYBKFRZFuEhso7qYigZ61uSam6hjTav/7JmZ5y9bpP
	 bOqCARV5JSN5Xwl1YtgmpC1yU8Q2zkC0qDptBpK+ddHrME611NY27nFGATFhvsnUGfq/Y
	 Kyg311hljhih4mDNElUyubmR6+8l4ZKnRCea0JMyG/rbaoaDfmU5898AphuXydG+5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a15QZEEx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB4606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AB4606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a15QZEEx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3h92487357
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CVJa0ec1ykJPShHAKneJEZU3
	KbXeSYGrLRw9bAOsE8E=; b=oNFDQYDlUqLDGYSfWQjJgUc0WhKW8Jlb9ArxRPaB
	JWgxzwCvr56yY2Doe23s4TlGFoH208Gb8rALErW8OFPHulDOE3OqhdwqsyFpuZfY
	RsrOin4v5QtflLUBmxtjLCLj37mPfH9H1R9KXC/LPUljoBPOoCYYmP2bA5KAWZ2h
	r6dMkSUXHyehmwbWW+CTxb/oC7arNxGXGrxNO4SlBV1ZPXk1TaZfnlu00sfI0CjX
	H55FTe4ZsCkd/chPEE4/qULcu6G1Z4pQqwjpyM5Ob/iznvZBK6H/ElhcZbGlNlzh
	cf6IWlY2a++noDatMBjVbLsyB7m0gD1PyoxM4QQmweTBJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso75888685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463394; x=1796068194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=a15QZEExQ3azXcvxJUtcZk/SokDnWoM9qMqkz5RsEB4SeCvZzzBUzQvyd2c68f+ht7
         lL6CVBjQw9gKwdfjjMmdTwndNyuigwvY8T1gzNE+uNybkGDsA4zVHBxa5dufeRHKtO4x
         JTpqe4M85qhv9npucOWRa6miA0SgFHX9rq/HTZIW3Jll3jHkcJxh1H5H5HTdpEyyU7sd
         TVcLgXFXUc9j5pbd4/7QhEz33XZxpdqlyBDe5mjLneyauh6k/pByRt56e55vSlHOKJ5z
         DvSlubqKfplBbOKhm0d+MBSpXpKrrNJPg0r9mr8cgo5mw4agSR1b2KMvKgT/87tdzDrT
         9Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463394; x=1796068194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=F+q+SOwz/C4ikU1uPZm/obtLwE8TCNYMbTuVJlFMc0upAc1+cFusgm8kTs5id9ql/M
         mFlFN0s1WOYAXjLHPqGtCVoN/X2kLAitRI2WO7UM3ltuPapLrmdhsTWCSF13TWWgIKn7
         rPR9TPbunLDcX8h9Pqv7EWgsfv8Twm65pgDNm//4vRoXs5evigOFw8qW68oxEVgVzLhL
         SRljjHlRXnlAqAy6J44J7G2YFoku7ZuxEsvgUrjgTCJJH3TQjWfY5Dn8L11/erD54Q+O
         PBxR5rhi6E4obaLjRT3Lo3LmJI9LlgAs3j6SgtDweL+rbulbqurrlrR0abqw60Py5BEF
         EjhQ==
X-Forwarded-Encrypted: i=1; AL+hErFFT0kQNMQIqHBclcmZTjqt5+XKOw34XBTOA4IXIu2OLcKPWstAZzacmn5e9Kr3utOgNdLmGRwZ3LGE228=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/PXA33/1qqyGZT/wrgnM5fzukeh6g9knic5+0jNEGgBIbw0nP
	ACmE0BqQaEywWQGc/tFS6W5xkJ25Yim+PwD6aCBCNqM/akwKMHLbJS3hmJDqLEyP7a8EWvdVB+z
	HI5n1XyYN+4UGgOmke0RhMKNtVkeYC5VC66qYbTFnZDVRY/PoBOMDoIdAy/wTKv1axdw=
X-Gm-Gg: AZFdTZdGPTJGYxNvuGxJDjX8QLSlwucmdP132snRhdJyAUwFtD9EIkNL+hx7gdGNijn
	BzaEg244RcD4g2BJjDCVyGYwH55rxtZBmD2BBCfCGGMiX7Sy20RQ58XLrdktxyH0vIrhs6P85zM
	19CeWyCJqZIg+o13vSkLmTdd8RDmoSzSw1jUMhlsnvStzQ3wDB2+DKj+oA7oqCSY0UbMZ5JwYpB
	d/YNWOfz5aUhEliU6tldCFcdfybmi81mSf9uTA4jhDMi9MuDOZR5SSBENZa5UGxfG9W1kf6Zdz3
	P3M8Rd+kHgrvqsZ5wGH6C+0754L0yH6x/g/HDAMixTJxFKX296lhQbVLtnHxF8PJONfnnnFra9m
	Qpi3SkxR1/Jn8O7+IqZqm1H3sp15F+q9VL7eoQuOASPPpuoHGnmOM1HrH47hpa0Kq
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003882685a.74.1795463394438;
        Mon, 23 Nov 2026 11:49:54 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003877585a.74.1795463393771;
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm376934425e9.3.2026.11.23.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable
 the EUD
Message-ID: <wq7xaiclvk6mxabafp5suuczp3n27sifs3lilfqpjx24esgike@q33z4veqdbtw>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5yjYEghTrQjk
 TCN3WziuFKHhJHdcCwgFFFuGzwq47MTyO9aubqPC5cQRZfSHqUfCbX1wqG4rqGvKgB5e9PD7lA+
 f4QOHnaHAW5mrSw/6YVaLSKj9t9Gef7Ji5qe37GHcDk3y/+0pzdfXan9NYr2g4XsmyLQrNWPrA8
 aWyUjdG0K0i48s4EjAYjf3vmlKx1oZAs+EFXZMO7ydTc7juqXp+/VjPelPuSHQ69peQZ1M0QzKU
 tJqOJM+pFR42HWPTs7KET1/WmV2Gt+fYVTsGZC6LtWXlodx/vFacN9zMf+BZSNu2rQF3sZ0enxz
 93Lwqnp3rhcXrutJyESqyOjuw1APHr6+PE936CRhiGuIF9VoNyMtTsGX6C1h/2nkAjUtDmNQD8X
 dpl/FPUyFQVhK6RzkJBEO5mh2lsyLWOzvVC7fplW4Fcb9XmzpMadTEtjrY9rQJESEhCIj+ACtti
 2kgxbYpg7NSTG7iu1HA==
X-Proofpoint-ORIG-GUID: sFVdx0pRZFM625yhCyLln438e4gkmeNC
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0498e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kF10rs2o5Heqwnj5SzoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sFVdx0pRZFM625yhCyLln438e4gkmeNC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2ivZMmhb0kPr
 5jkOJ5QbTj9UDB6gxt84rT8d+u469KYFG8NhhA8ZyI8fykz+36MdtVgHKVw3pAut9EmpPxyFU1k
 Wow2DDw82fFZpSA36vV102qu5zo0bHg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:43:00, Igor Opaniuk wrote:
> The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
> sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
> adapter uses to debug the SoC.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
