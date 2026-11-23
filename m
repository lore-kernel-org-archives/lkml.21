Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462609;
	b=vWp5gsTTD0WVOMAzcUpdyeLwZQGcy0jh/2duhYT+DUeCvrcRZjr24qJ61ngXG/SMppjq
	 eDBuqGaB4Xw1olI+29j0d2ugpIEQa4hOuFP7bD4ClX/kmi3Jm3yZcRhCJGlJHdzDxwcyG
	 QCHr1GpFykW4eOqM73YcE5kpd189dwrFkCivv5sRU3mNtcvfSSCXvsH7feLDcng0vjxiq
	 4jXkEOwPRPd5touqj3g2tneLxDqCIlHVMZNxP1aH86vBmGp2+VIFBnYqwPtHgJYxNwGku
	 0FO4ZAbycsWahGw9lhytgjPPl1QD7cHVT03IJ1mL7O0OG4+IYbyNWrJgjhdENI3OyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
	b=yBTMSAiiMruyzpyRVdIW4v3t+mBs46H8pZop/vMwcF6oU4pDKC4W15BdqGkGzTR/fRGN
	 tMN9gA7rq5ZUK8/fsPgld45pAveJBiLafU/ZunZEqqVgYJjqGJsoZU5fguopVJbInKKK8
	 PAQihBjIT/dgWKG3xmyXprhqhMYN28dSkIYJNZ5B9arkKwuJfK8NeSvToDHhpi4PhoDwR
	 KIqYK3BlLwH6r+OYIoNRdRAeX8t+Z56lApv0m6rre7KOCk1VV8GThzJxF9rA+pgKsI3yi
	 tEjh4JFdvEGAJe3qkBQUN8cb/Ngd9M/+iTjLLZ92/8i27L1lOC2ROQjCSfNQTcsmtCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E0606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNFPs647029
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aU+cchuetqDtzjD9jSrzXmm
	5L9uzDfuqw5ewOyVopE=; b=iVxyptQyjbLdiD3MOBcuca1LHEDdlI/vq7mQDPNn
	L6TB/voo6VsCPcz55NyJQ2q4PbOshmC2Rzxl5Iahos3fItygEA+NnHwNcPP3w33T
	uWgi1qjKEPmolYVbfpX+3zntRn9lIsfl2hWnVmCWRUm5cV/q7TKAZL9zTuDAJs2j
	l/Vw8B8fzaKZNoUIkZk9ZvIwFl7eBD7cUQB2npHEWqwasg5QcPsm2Mz9XbhXOuV0
	QUhdTmByTU5OVQ1sQ3oO8qNmuIYcPKqGLQ44u/rKh5aVjloFkDsV2YfAH+d3CqdM
	UKs3aJBrTnJOzE9A2qSFxkhY7GpGQdwqlGkPsQc9UZWUxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg1h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920fb8b9859so113463726d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462607; x=1796067407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=bKAti34Mh7WNLgI2C9TuC+tqXFyihBwGWkk/rJotugXxvSJxfNzciunb4KOALivbmG
         BKDhp5fTyznyglrUoo2fYidmonWKVPnFX3zX/kU9ELWe81fzr22g7XAsiGq+og13RcsT
         zGNvvcDMhpvuMltMz2fI/l3UDLNldg6EAaStM4zfIsAUPAtFhLm1cde0UsraXojq9xyi
         jfZRnaoIITipuOxd/EMIKCn8dC7Sv8EmuFbTWHT7cWMHdpkc9f/zyX5tyHNXeJ5y7dYC
         H4Pl+rvtQTD9xYqfgOlMpc9IKMCoMb7k7lOsrOrDe/zcE6RAOnMPJCEwUpNES4xlsKaN
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462607; x=1796067407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=YyG47JkJFQ00V7jC+awuyEm5j6tZ7SxbNAJ3DJLE/byQlL0z4F0RwQTVhMOH5v5I3e
         7n3/P/hif25uypS8uLLnoIMr7/CEXjH41yhl72uXY5wBzqh3hjdiFrGBHuvhISYKtpOH
         n1lP74mD2rWmGdwvrVZob36eDcBoD+kiiBU8W3vj1h22JA+VlwGrdPw8bK2igztiUkSF
         3d4xm2VzQT1kvHgGY55JaUALLkLnUuRI4P9StanYLy4E1OW5ZwIHJXTotDAUZ9kgpGTD
         EInCXlzjfrS5uEEIheA2cvAtdhab3RaaybcUC6Oo8bBWRdOm78QmYWngaMLQEj42EmSi
         qLJQ==
X-Forwarded-Encrypted: i=1; AL+hErGUWlc4x08n7d4aL86vcUZcdynA4eAZh82dLEISvhXlLujxH8RaPHNFp4j2Ut8FFvqvN6gpR8AvYEtsSWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HPD0L8d0UGx/aFRFq2CcQ66/iD2LSXMtunCi0QCgCJWpNQGXK
	nN/OEqYGfyd20Zkj59Qnp/L6aYdfcf206+D5q9EUxjSFV5YI970iS/znV4y7Id3qulJsrdMEQR+
	9NI9aHFL27viBGAJqxLKgpkB72ZyB4vAEegG9sfo1U0dUj8Br45OBjI28MaB7DXyYdZs=
X-Gm-Gg: AZFdTZf+/RRSzmPHNZL64n0UofeuAs71JDTB3nwdGxgze3mh7nqf+WRHpN2COvGMiPK
	nx2PoMJ5HVMTj+dTphPakSIeknmiYvr0w0T06hjgDNJ2ewsRlMEGnbEWCJkDVd73RpnE2WgON/t
	XJhNP+1Kq9uDDzHMVZCI1PcF4yJNAMYpHx2PkpslhR5y5Oo3Oe/bS5caupSwUKyMqPN/ke74rg1
	Nk4ZZ6iy5DguoFAjYVyWbSFHPPkK8EjUMsF3mdTXhRBKaGlw5lw0EBsIZ/zuX5G+99BZxz7mTJh
	z1+5c681Esch4ADs6SuCG/Q+tso8PUbxUEYgJKWVBwAfMF8P4Ue1Tjn050n3WAQ4xLRO0OKn5uz
	4iTuIavHkhSt6kFOkfoHq73gJVeDcsSFkiaFhZaxgMprtrQYaDNE7vlQyr4d88pkW
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280102585a.14.1795462606830;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280096985a.14.1795462606303;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm336356205e9.12.2026.11.23.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:36:45 -0800 (PST)
Date: Mon, 23 Nov 2026 21:36:44 +0200
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
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Message-ID: <j4zssaws6gb4cico53bwweb3755agxwrunxao3ykvbpa4rbzi3@j3lkijgta4as>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0495cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M6omgQR0Woip3EZOlBYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8jH/kvMSb8pU
 OXwneZlfK/FgNymV6X3WFQCoCNyKbTVwHbziny7+VItlJcAAgxmqu23vbNmWWRN+y6m/eWOLTRZ
 ilaVLv3cFywAC2dIuwS7x8zE8hWU3O1644LPgUnJ/FF6XwZwsmUtoZ3M7zos0qjGpn5yKxUkI+M
 3E/BhvaoBaU4StPFazhtJgCmXDcUiaUG3uAp3vkxTdsNV1RGdtzTGxzv0Lc+dyqoTkKxmkyBARy
 kLepF8Bv+VOHcntZGIkYRtuFZs9+t49JJFhpVynz12Qy4o13JZ6/vAw7KLiUqekuGwj+H55oBx5
 z+i0AWm12XJo9KnYow/F9/0d7EDg9HvLOXughu4fO7Bsc49tsEerVit+jPP1/rrebu2f45njo4H
 q6SZ0jDzkaFQsIxPoBmZONKlBGyS6W2+WcYCTZmFPj9OA8PrUOIQKevIdlPmaorJTiNDgEfq/Ly
 oOYLDyW2AdpmWdYm15g==
X-Proofpoint-GUID: 9uh-zrG9NVaPqvHf5MxZt0pQDwzPY0-P
X-Proofpoint-ORIG-GUID: 9uh-zrG9NVaPqvHf5MxZt0pQDwzPY0-P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzKycN+LWLVvl
 t19t4UFBc/HmnT2qEF+HKSUkkoo6+kS8R/2pRev7O7qSLkM7l9Rf53NAW5O3GN1vgzvPIbvGUSC
 yFrCQ7yR7Szd9iqbsx0pTeGQixpc7Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:37, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The VI sense master ports (10 and 11) are picked up from the VISENSE
> slot of the per-speaker qcom,port-mapping, which differs from the
> mahua-t14s Gen 7 layout (12/13).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
