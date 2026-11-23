Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462550;
	b=fwFQJyDAFEjXzVWfiBswvX3WTZkDnrGYQ07hstRQIQmAd2lTAVavNfS4tGHooqe4cvw7
	 jyq2cU61TAeCinzOwbsGDoa3Le5w9WqIJJw9eJKzFP3piUHVfB0tEHvIxUjzZ0aawCLNp
	 IiaB9+HgeOEdRmv/hYYNS2qh1tnmJvCwRUVjWpoz2t3xoANpeY+40Yggc6428TvMOu3Pc
	 KgloQWjCtBaxDCebr3ya7sVleyOpN422H0MExMyMFU714a38jk72gkRUfKg7096OMMoFj
	 S5Sd11Q0woD1iWTL/Hez2/BzHW7VGoffRhz6JG0OGMJODcvSGDclEEqlZOp2VNxbD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
	b=41tG1u1mxL1jrbDteC6A0dzqZHLIPKYSVVJwtoq5NKQR79vvfqDIZqupFR2FjXHeknJU
	 3XpgxQsa3WjGUxYNKDydvBHhdlPKWXp1EW+TX/Y+WLCQtl+1o1iAGz2XwHAhWodAnlFA1
	 lBw6UpqIv6LBno5u5FA30zGJ+XWgMsf2jeUsYVxynUwGbTCiNRepZeBMiP46+Ni0BAwnV
	 QJWYoy6i/lxDAb3Eh2ortSyhlY4ES+xtUqDDBOYg1dIt92AweTPjLWbVPvKRaam+EjIBR
	 Iu6cfhaZXkVkexIizWx/MBTFJ585fEE/Sh+Zg3MQPK1uMeV0DFwc0rIrvYARSJ3MIlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dBGsAsBH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713C606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6713C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dBGsAsBH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNqHe648462
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ATnvF+h260FN8MLJBDwPRObd
	JGnZLhXg2pCZXyHXGbU=; b=mbW++9hUY1fsY0j9H3BpmGB5uG0rq0SXmEcrKWuU
	Wf9JYPwsuvAOK+PxMP6Kj2JzDlPg7DrlLg3lK/QuOAv9ufsKe7D8kb/iiU84RafK
	GSX5Q0Ia8SGbmeXx3kecdW1ekt4nqx4aRfQ+q6Ge0Sv8wg0d2IvUmt4xfT2tXbAF
	mSkuTfXYcLzvmpC3cXl55FdIZPo9mD2KRqL11bK3xKGobnxx7UQMisoVFgHnWfuo
	kdDF85Ike6zWOL22+nXTEQ0adUvll+OdKsjQ5hIHBayH1Iyr0+e7mRYxHiHSZ2UX
	Gvj2jesB0GjQyyjsoXYd+71GxaWKkfvx67aV9VXllJO/NQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg1e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so599978785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462549; x=1796067349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=dBGsAsBHIuxON/KGSmCW+r82I3Yf+SzEeKEKbD/sJjz1mPUl5HdI8lOwFnkBjx5u5E
         ZRSMMT/pYUHmQ9FVYze+dM74oZvf3CU/AcqclX5nehBHbKaRWgfw/mKms+w2otklVT5w
         Mtbf+ftnzba+J5t0W1Y3ppNP2RCWq/K3XZKW98fQDiWqi1QSvcVF2c7JAcl5HkzAhEEG
         w7Cil6hPrOcbsXR8+SRSJOVXU5If5fH+a6Pmcv0gQVnrdled77FwrNVbr5RVxqKBHZa4
         YAF38XnZwV5PaXhwdcD1Z/iBINAQH2azr4+Jmo3bkpvxS0Y4rn81u7X4xQ0E5Xa8+mP7
         ysdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462549; x=1796067349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=lpo6iKNEjA8UIJzRSZeReurkeGqjMtqgl+vLCc0HzANBP3gcR05YsNQiXqQoa/Y00I
         38dFV7RvrjAwyehlVkwyN4i4iMQkMloRTiPp1Jy2VIzkbzKfx4Kq36wRddOHJv/vBxKI
         cx87PkdgvyBUkIYdQmH1M6EpeuazMjTUaHrivhUT5GFGC8LtBqXg7s0iiTy/Hr3qMXLV
         cASxLomhNpPiSiWd8agcD6FQhlYItLCAe2CSZaHjxLSPIMNt9i+/YC9ROIk/NN7y7QV/
         Brhn41zydLZDCRYX9TcfOWM8HJuRoDrrEi3QlDO7cbyDv+x675UqqtCC8mQfo9Fp2NkK
         jtyg==
X-Forwarded-Encrypted: i=1; AL+hErGMP0Y9+aWMXgtocXDlr/hIl5ugHE4Buhsq8EYmAsG81z+d+Q35fuhCAPLrfz4NUOT0V3pJoDrxrFDJg4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VdseTCpKPZRZezqdk3PCr8cei1Morhhp91i0VGiPRZuK5d6WG
	MbcMwLosVM5XbpyHEa9PNvZH0/zmNj/CVu5rekgAjoYlft8JiL2Lw7KIDaq2FeCjHB3pl2/p7aO
	JnLeZdHbX8MQkuvHmnL37VlFj9n4F72cQP+XmmFU8k6RtssZz6/Sb6C024f4yQ76wUyU=
X-Gm-Gg: AZFdTZf0e0tnkZ9u53py4oo5Nvpn9U2PmN9n/sanXNmAu+LWaSEH8sF2kyQm9ITFhYx
	NE4u6A44Fv4BhfjjtA4o69skXPy+L8IlPAIR8E4/9JxL7MmVzYSRB13evaWZrXv5t1bkvIRDrpG
	AvaDoHb1tLfsqSgzHBNJql2WyFHMg5e7lI5Pn2OSOtU1UwPhnDkqawsBSy+AFdooRIN6HjQhaBP
	H4sOnG1anXbBWTaD2A1Z3Q1kKPEGDAXy/30hYuzADl7f07fyalwYs8jg3xOO2Vi27hJpIkYBj+7
	/I1udjsDC1kgfNqv3zqv59CqZ1qtrg4GNu0CwICGE7xClwgh+LYPJTZbZmgaLhSQNwirqVkKt34
	7TBKH02eozUJ5wCvPOn+FP8hVuSP2Rudw2nNcDJDmupUjQS1wINRSAVT2X/8CCAM9
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368360885a.26.1795462548362;
        Mon, 23 Nov 2026 11:35:48 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368353185a.26.1795462547715;
        Mon, 23 Nov 2026 11:35:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm693167355e9.4.2026.11.23.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker
 protection VI feedback
Message-ID: <cqt5tjq4n3tezxy7qtqrnkthykx7hjocp3lxcxujkedqjaimi2@6wth3npbs5zu>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049595 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mYPpENzYAmZ0sQmgenMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX6xS2SWAh0kI9
 gIbN84u7oLmQUmMtb8B2kZa4/uyNkc80jEjVAmNX2aiA4Z9SaFm6HL7ZQL3v82pudc4DFMULoZ6
 WrUK2YkNMcqSy+lyqQCkTkGwa1DfCcGb3P6Jb28Mms/U6x1QoCtbZR2YX73K92W+aM88SI/JHsL
 96wFEu5ihKWKQiWRhsIAdVFLYzPh5ckAM0DA2aZL8RAZHTO0Q65VybXQ3AAMFU7Dr7spH+oTIOg
 5Fbd3oPcCYDAXDGNc/uoAIYViGqj94KBLDguqcMd5OqSK/olcAuPfmI9HAybE2dvMJCFBkyMJjb
 WuOVlWo545Xnrw4m1BCgdcQswzSnd8xrSnQesuO41pbeb4tcdwLHh115a3uKr0dpHEa7ttwBuzc
 RuGYK/KhuIcN72HPnxFmcfj3es+ncxEmupv8AXb+uFA1J59dk9o+qJ/rkQ9ECrDybCvaGK2Qf2F
 ivz4Dieu8K1joqxRylQ==
X-Proofpoint-GUID: 5lYJMcDOmhFd7Vd79YggN6NCh0TZQ1bT
X-Proofpoint-ORIG-GUID: 5lYJMcDOmhFd7Vd79YggN6NCh0TZQ1bT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX5XKOsBEp6IHH
 C8NJX1dnTAs9eIeLP+nPu0SNdXb2Vn5qprrbSCh+MyotK/fC6Uq/HE7ktSYjazFo0aCmEQgXclO
 GNGWjrW4oBcdrBcDGJNKCOe6yUBFpow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-22 16:14:36, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on the same WSA Playback link. One
> MM1 playback open brings up both chains via the machine driver's
> multi_direction_codecs flag; the SP<->SP_VI control link in the
> topology handles the DSP-side pairing.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
