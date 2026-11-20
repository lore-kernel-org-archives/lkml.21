Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169570;
	b=svT50FuvSx68mWZxugXITr/S88TzUzIg7i1cgoTVAeGdDgrcL1BHBPzc/CWwoYq3WYK1
	 42CQJG3VbXAgF7Bga+VhRz3UTOx6Xxo8ZIHRgKVgp/DthTNixNDxQxb8F3VGN5LTsRlcg
	 1J6Mx9+OOw+9P2xv/1Cm1aJsugBPYH4cCVyv+K7RtpSd1S2Yh3iNZwvsDMTunEAJd5k16
	 VI2wETvUibkh1XF/AE16ZMaUxerTNffqqRfhmpsBD3EKE0Gb6gQYCZZvRYURFpaXEJYvU
	 iE+yDrj0I2vbsuAjF08MjdD4Q7JUfsV3PmBwu8l1oMrfAzhoyjjydzjiupOxeQRF3Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
	b=ufhsDCcjI8cGwrhlevcaYZF40pFD3ToiPF+XDjzsF529NOEl2dBxTZpbj2gD+eOL6XCM
	 jwgFPOdGIxbSuwLsdv9P6QEyP/bkvGXrkzEJYik1O8+A51KSQOB/tlPqHtZPJdJaTVisP
	 Xj1RajPFHpCpEXZw8vTroFXwA6nZj0MyNuGU1mC9KXAICKar6XynsdYlX2XSMmc6zLGzg
	 fzjqy7zDhVBMJnjPWrzOqtm84aQRU7oggTGvhR8P645fMVzl/i9mwpR+T07TTOHO99ktm
	 Ggm1V5U9J4RusmlGxTytf+gmQk5dBhz03MvpDBudF7w+q/Nm+PMgedRK767WUVecYwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB131606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB131606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewNv605904
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BYSlGEtU75YElxD5lJINvAQF
	MqsMXtuHFnBFwhEDs8U=; b=OuzWMIjaj2D4CNLoBSuJtqqSam1WrBXTZkGhhaqd
	j8bdTYi3KvcZP9jenjLlPtdVrWuM7MsE6Rc/We6Q4kAbUfEcIF/fmMdTEy5b/L1x
	iodrUkmSUCxsNf5RJBw8YQ9MXCQOJFJA9IUSMJ7dMk3foO4Ows8JSLcq0bRFkSmG
	j6e/MUHhYiGqPoYVYzIfHZaE+VodUJz75OY/eVakvEBUWBh67ZuDX7kRdm5PhxF5
	8JiHgRjxrCrBrWNmPLhlBs2p13Nl8OwFgAMSGY2L8wfFOx9K/VjBHal+PAAphZD3
	iWRe1gbS2rcC5MHV6Z+IPa3Kn6NHihnqGHFqQitOpMlhDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs13s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so161611485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169568; x=1795774368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=d99DNyi9Or35O3bPY1BXPVgy/15/SwziMuu3cJIFzkrlShwlxk2M8Eq5WLNz/zkm/I
         Lc8vB3OA1eC4upVrXOLkl/rdbGWW/CzpirDtXgaB2Hrt9v3CrcFPbqdCXNejjl6ng7Z5
         Bc4bpPVR9nVs6HWOCjopP7Gu5oQGuIeHpKPRmAOUAoMQWAr44AWUGlzEUCkiU4ZHl2kn
         Bv45CI0dJV1IEs3kglFGseqo6WX5oZYju3YZOqCSwFBSmFxM0SJuf6/uKfzzFkQRbYb+
         6EMHxHYHMBCeTcZNZRM4aoP6ynGF32xgUUsGACv02dtqZ4OpYZMqXggYOCXwV5SOCvmi
         46dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169568; x=1795774368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=R1xHK1YWvMnQbisjRr+IbjAlsXRUwepNcmnH5D8X0XLnFEZ4hcB605UPO6TviLJnyk
         DydEC2Ua38NyynltQ6k7PL1BZZLvqiRI2q5xTaNmvgkRq1CwmlzXW0rs8VYahTRQcVpb
         lVP7xd/cejZIaiWoHk0IqoSfyAUnDmf3uT/IJQY7pBq+5O7xV8hfsaVatBClkUIBU/Qf
         YxJCHCUtz9hL1DMFX8udRjBQRn+qxMmpgtz6E0NZWJR04xHMRkDCXrqA/za6LFAIKbg0
         2KZ5k6tzvek6y2QJML8VLE0fHqZe2DxB0RfBukR48xKmZj4sWGGNl9Aqs7R+zM8EVRvl
         2eLQ==
X-Forwarded-Encrypted: i=1; AL+hErEKRf9JNdJpdzRAhDL0y8VMYipakdw3p8qWXEHsPx/dhZXZqUhL6mJFsDsz2lM6SXKEY5EhPzTWZqSWtaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CU4V9s36fZhPyz3TcczX3PQwZcXRSeO+jKyp4yIwkEuf2pLVh
	rxXXofOprkqzXnuAeFleQLFviv+fDjmFplpz7nHd/bGdGB5lEuQN3fBdCcbAB+f5bAT565bh6L6
	tduRymEDHxXDcC4IAAIBmKTQtYzneQ3Do5B/Pj9m5w2G+LdQqqwr08OG5nlnEXpjufOI=
X-Gm-Gg: AYBFou0FO5kXzCMqBU11XJ7+KxIyHY/ttA8kHuEkzrcnAvpTAubRaNixVD7fJgYAFbR
	Fl8h3lhOC/Vrg4BwzGTdXcugw2OinrlOK1mf0UTPylFQwoDk8r5jdE5DHFuvKW04GmXQyTFeWN4
	Ebx+vr1djRa5orzyvGxrOXAz9W7VAbCMRBznFu5eDTuiuFIJCyUu7xqoZEkptNet70aCRzXJasx
	uA0tKCbbU3xHOfmZKlEy6toLwXGdjHN66QyM8iecQ62nPw2TdqVMAZu+4z4eAgqLI6h7uRuJXr/
	WRlE7/FaNhXb2JUOSK4iP+VITp3yiZGrxdfiBVUtm9V6+l7xQVgPyErrEQtMoQsCJeMyJsL7M8u
	IGiTAROoAkvbC02pY/vvMCKuz1p+aMfDFPlDV/OhZ69gfwmBlU76hJEh6vwF8NRMV
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464639285a.3.1795169567699;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464635785a.3.1795169567099;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm104468205e9.11.2026.11.20.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:12:46 -0800 (PST)
Date: Fri, 20 Nov 2026 12:12:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Global clock
 controller on Halliday
Message-ID: <llizdibjhqld7dbkdwt3vz2oyeiqsqb4rduunjlnthmhy3r3c3@vct73wnh6kpb>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX50B/zUq2RIrV
 yxhL769QkYhaTraeSJIodgL6vA67XsEOtW5AkNWMZg3wduR0M/Cac4CgM0aIuZ2z8swxLsW8SgU
 FOnG5DnEEJNQB0FBKUjdNK6KjdlmwZfdCv37vtzTpYzlcVyEYXuw0b7xjXoAwwZbiQbVwSccywZ
 mYX7aBwoIOiyGQoDJFfngymJ+hpRGZAJhkH0C4FLlzvXXnSd7MYUfZaDxe8i214Yfgv9ZBoevvx
 Ll7qs5aENbKmfEPcZPcHfXwRUmor2Rmw03d1kT/d5QHVb1Rny/CSwLQkmyOpWm6vJFIlDQViP2y
 82pM1WKoVK9RS+trzqzOzHC9KrhnSYwV9EbcA7RrZXqwZMX8Pzl5NsflP8Pz8r8YEbRBxp9NURK
 jI7sg/6yDLtfSGlUbKh1G3TEPJioJ+kt16brdRQIJwyuUIM66z0d392jv60vTD/2+XmQABdPPff
 tQFgQdvjbBYLcm/osuA==
X-Proofpoint-GUID: mRQhX8dCAGI3dViTX_4oie1BNvnEb6Wp
X-Proofpoint-ORIG-GUID: mRQhX8dCAGI3dViTX_4oie1BNvnEb6Wp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX519+VefEWFXy
 XTY0P/yQuj413TbYWcCgbnEHbeF/PZVxcta/I191In3Ei6ciIvnOnDPdDHA0c9PSdi4GGFW4lCV
 63+ge83ZX/A7dk/CPhjqEqXjaszMHKs=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b001d21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QvFfK8P1GQIJS_-KitYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-16 21:24:23, Stanislav Aleksandrov wrote:
> Add the driver for the Global Clock Controller on the Qualcomm Halliday
> SoC. The clock tables are based on Qualcomm's downstream gcc-anorak
> driver, without its hardware-control and HLOS vote clocks.
> 
> The eight clkref_en clocks are clk_ref clocks that vote for the QREF
> supplies.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
