Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599027;
	b=B0L+LIxEEGRGmQvL9HMiAks+D8jQ1+aQSs7WHLTs/VftuR21NpaZUQqI5CFvz9jLsGxx
	 8eLdtZrXdzGWay940NT3oKT57o2iBfYrLXYkw8JpVEzJya6rCmOU3wI9+i/b+bwYqbjZo
	 9oXtCTp6PcP/ToNsrCpJe3WjVWbYE4jMHdTLYU1o5AV6GcPI8Ei4VPWGzJYjuw9ImpfB/
	 fU28SaEwm/jay2xYw7CYs1GtikbTyAozDeQeM8C7hzD9wD3X+Ynao5gesxY+muQVdPHLM
	 ypP6/LdmoTdDJ4gLBqJIQKIp0a0Ij64A06wBg/rBBHGs01gGxlzFsIt20E2/ZjBcUPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
	b=LbRDQtKBwIAU7ibRFv8QOHhD5qSnPHz7P4lKFQ5ANBIym/R90xhTT9/z4t2btZ5GwR8+
	 ZEDOdkkyWZlQqQdnPBuLZkS5vwCuXKPyiQ6YGHon2Xqkn8oRlZxXVKeOSh7Q+CxDoILZ2
	 Wfx93AFJ+MxG5Lbvc4150PWbHv/TLXGuMaFTmwP3EDmdvOa+7Ov6hz03WGIWJpSntWXOP
	 WE4KJz4+g+Cyd77LUPVRjKgSKWv8Q+gfKZ3FYDcLPGbhhw2F06skCdTZNiTap3ZWPIWvA
	 3FI6GjsY8RI9izyCpO+9Wm10/S2kYjfDbyP5saMS39KucB1V/O/XO6EqBtf1zB44fiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuRk2R9D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5877606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5877606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuRk2R9D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9Cfvj4048424
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMF8AgDnGajgqsL/XKmOeeqW
	WFeYelvrpbA+S49mnc4=; b=SLTWBrfAjL+AhhBnNSNdJoCcl3OjCwoZmueEiR4S
	wv1I9ME+zUa2DLwQ0rEFh8ltUturc3vK1NqNxErYyoshKLHtsgbZo+UI6RJ9CnYR
	2XOfOeMtzVJpFHn8Yjk3gyWO3B5uWSlKF/5v0nhCE6i0R4eEGaCceSZK0D3IfSCs
	1w6Xbvcm1iABubcTp4KGrCJ3IwqvBpJZ7LRlXUC+uuW4ef8V/AT/zV120YLma7Hn
	KS7knVatp2lVxNDSJz9bVDfWl78+qaKLiYjZxYuE98RVjiVzSq8aoV6321QKkUcM
	+HOaZBehr2X0UpHSi2N9Qk9vsWTl2uELzhHLFYutwszqhw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr3rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so5451872c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599025; x=1796203825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=GuRk2R9DhZFoT8kIekTrRRRPSJbClqcmRCHM1OR5urozasXzx1ufxixdlcBcV57dWq
         A9TKI6mvPTVDlDqsM79C8237X0bllFJhsQp0x28Bn2SlwX3ahYCKddpunnntQRj/wAsB
         LBFH5NbziwO0ZX4PlN1mSmTlxJOt9zXYClhLUkHdP/nQLhNUWNmEtUemC1Y9C4+hE2Qj
         xXqNJ1w3NrKDLSRw2+qwsYfk+jy/ljXKS+7ItVQFUJ1pe8ir6e8cS4wUCRbTPx3Fg4vZ
         GsveoKPQriwZO317pPgLJREdrExx+JA0Z4H751ofQ2QhPqXrMa1GZIfk/ryV4vgAsAFA
         R7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599025; x=1796203825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=QJOqEddZXaTB8B+XehiJsFmCzkME/Obc5DHm5v9pfPyrlm7FZ4M1VPjH8Q+OWu4AgX
         +K2/1JN4FGGEiGI7rr/THGSBobFgp6TnOr1tmtvC4DKfSVIJfQsTJSRsaxrn6JlD7ZIO
         zRbOqYtCufu1aVAS5vkWW7Ms4fKqZvb4XXQsQ4bV03x6hFFwM9j04nTTIFlgdM0sQY09
         sEYl4eeaZqLbEZO8edFVwPZj+rDwnVnWLmUGuDitPDPZvynPERjAgLLa5PToQftJHceV
         R0+aSaeTSvZKgJUzMgZc+iIVWJMBWDfhcL2yfppXRa77gckgHqoydPJ139/mHYRkx0Mv
         6iWQ==
X-Forwarded-Encrypted: i=1; AL+hErFyeAPnoHw43DRNIUSYozi7V1mEg9ufvuu6X7xLzBPhI0mwP6e1osJUIMuXKJqt8jdwnwnRVPcl0E1Vlq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u4hGE5Hjol8XUbWXhPwshm97dwhh1p+3OEZ2vuSqhzKDfFYj+
	fXG4VL2tu9VfyucMxiNMZmrrfdy7QnQY4pCX/2O58cKTZX24ED8xto7sx0H6/DABNJ309VYHf1H
	O8kyBMrKos0Xst6mnEhqIWP+dpHsHLp8oCEMS5o+eT90f8gDHAPRzTskyDLK9OfnhOVo=
X-Gm-Gg: AZFdTZceG3XjsoFNZk2oitMINpkNSUcY86Ui0h6Wc34jy0bjxjDHUpAbAA65cqobIJB
	uzTyeAmU9YC0h2/EW+Do4P3uokX31WpLO2BDMeTsQsBHE+wW1PB7fkqwgcKbndJv0AonmffcpH+
	eRrW+XEveobTYJIPP1Dp81EOoSGZeeAdbU9uU8zEPZ4fKU3qdcrB7CjAKE4Er+NOvtQE4FVPIRQ
	WKVYmFbrzy8i5MvbfkfyLpD0s7BIu8irIx2/4yYjPV/U6MaU+bDGBWEuUCVFpkHVvqcqzisraPw
	7sIaPAoHKFfmhz5chfXqF6yk9guhK0z7aWilyYbOh7sBOa0/PxdS9w1KSDzFT6IlUtewmlN8utx
	wMD42MTyz7uFRLc1WpB3zgHc6YmcwonEFEQvE/VszsMLnMJYcqz5diT3Pe8IAZuL41MsrKX3vgn
	ddcQ20c32knLanx09oz6MBUfk=
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649569c88.16.1795599024488;
        Wed, 25 Nov 2026 01:30:24 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649537c88.16.1795599023960;
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm46753868eec.20.2026.11.25.01.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Date: Wed, 25 Nov 2026 01:30:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <awaqrbU1n-40XQ5G@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
 <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
 <awT8VH-ZccQXmw-G@vbox>
 <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
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
In-Reply-To: <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06aab1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yfwHPf6EdPLVZ9QPc6AA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: GvMqlWEeVOJPKr3eENRXxUZCttKhCjLF
X-Proofpoint-ORIG-GUID: GvMqlWEeVOJPKr3eENRXxUZCttKhCjLF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX9rvkzWdSlfMR
 JMkjRaGupZhilO7zwpjHZt7gpzkShmnHX2INPHP4kkzdQIMhd5aKrDoMgW4m9cbkFCKTJWfB73m
 mV02zoBHiQVlA90Ow6ZJGVZkxlr3c0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfXyfEx7zPuZ98K
 TAFpLtJzpHVHe7kk8RCtZXJFkfVjnI849f6eLbWIUmxGA3V4eRlsVkUQLijATLUWeOT3gfzFYsM
 dlo48yUv2IyTJBf2fUY6WuniiiJoj61vhVinS7VPFrplatgq1ZSmUxU/WHu5AU8/z+mIHj1rF7p
 LghNNu0KDKyiK35IhuJum85MPZ5EsNBR4uU0B4ik5TMhNPi1XWuARTm1WLSlu4rAxvB53DCysiu
 BYQDHkoAPZWb/JaL9EtumuE1BeZeTPpkkbCvAABx4GIBe8bAnVhsWD5cSLEXv33wwqSUQ29bwJy
 8WbzN/F/ebiH+SuY8OBYTt4pdUgPMfJWXkiWtthOtzFFSeAqENkDfthusr90LQHqr0ouzWMnjan
 LmL9C5V/3CGeFFUubdR8kfU6qf5AETm4yyA7iwn9o43Y8MEG7Akgpe30Z0jMuIFRDCxv8EESKvA
 p9eNkpKWyetB0FiA9pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On 26-11-24 20:47:36, Peter Chen wrote:
> > Which other platforms can you test? I'm fine with the change if it's
> > tested enough across platforms, or if the affected platforms have a way
> > to keep the current default.
> > 
> 
> There are 10+ SoCs enable USB wakeup default on for Qcom, I think it is
> hard for without function regression we keep PHY off during the suspend,
> although it also should be fixed. Let's see Bjorn's opinion?
> 

One wakeup disabled failure has reported and fixed [1]

[1]: https://lore.kernel.org/r/20261112141512.1840-1-26rote@gmail.com

-- 

Thanks,
Peter Chen
