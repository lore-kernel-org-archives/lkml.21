Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498878;
	b=xfu4EKCSq1OdmctVs1Df94Vubwx7n7kRxODfq3ENxepFcnrfmKRe4dmqwnfEQg3Cy6lc
	 1CfwYKbAWf8bjBsgyzHiRCubD9xRoNT4ZH8SGLwSqS8b+TuRsWb1ySPGkoUCbl/DcgtSl
	 SbLzT0JaoZdW5ZS3S//Qz3cn28F++hlBoQNTZ+WW8eflXlQbYufAheM9fjE3nVB7B0L4D
	 mSOGDf0CnA6rc46MxQIs6DdnVY3yIe44XIoZ7c2D3kdjQSQfY0+v2ocH7c/MoEYCBO8cS
	 vG79e2Goi1WrFGpcXqWGdlYgzA7NHTC29VvdAOsgaUJIpAxfhLreJL84dDILxrRXmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
	b=lrCOIXgeXh6hcMaaGZQR7c3+z+CZqwYM94QSm+PwX678kIUGWuuRoZJ3BuSL0JERSy8i
	 WfFHyciNLPhxseT/RVIARMCIn4G8aOcYp2ZO8f7WLrM9BhC+zM+Wl2W9jGk1VoeMo8EVP
	 sPO96tpyHrv/tBvoyLr8633JdcXFvm3pIJ8VnHtZ4M50FyxqIlDTZaCRk5n6ky6aKiZap
	 CZK25e5w7/Loc5H2HC4wSlauSI9SEsFMB5a2Ajgo5Rd9piw9emcQKAQ2mB4r9H9or5No8
	 CwCOlBlyDK+qAsWZ2RsgsjUskKu45uK6VnZOz/2G6HvSXMEXwtWatrkK00eFyGI8I5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB553606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB553606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k4sM3701196
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOBU131/4qciZb8oZkVAWZTb
	JhUnx5MzQKnYpNsi6jc=; b=oG6MJFcWsXBLrudRR9Ik5L3vYygC3u8KPS+9Nrqp
	lEwi9P+zVtXyP0Hm/GVpcWFd+Q+aXnBzvFqdaHgsABg7IIJIWDEiMetc7hgaMrFN
	ArTgcHoTT+X+4QYJxI1iNF9QCX3B0e0NhMSCvQ5sr1OFuvVCw+0O5pkFx+E1h3C8
	tYIdbh6NqZFmxFEdZ8beUoJX1GCJnamZmrp/ZecKy49KAHI5uU+XCViSDwLPKf/5
	PqAw6cWhdt5HfXRteN5W4c/6GItDcZNoyX5cAMBhzusHstRLJKubypTUECvyvvXH
	ETwjYst0nbzC9jn0JJcWlBf3+UeRU7QxUzmCEjlCbiQfKw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky0vqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:41:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920f97bcad4so75945106d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795498876; x=1796103676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=ioOahv7A0EoqXXvOho07plftjoMoUhSz/0K6vWzAFCob09Fw0Y5MWge94rVi+iToIi
         vW041A5xuBac3FMG8Vl9kdsll5Xo7OMgeaee3xoP9IAr5Mz6sgnRC9rMzsyGNx1mDC2q
         dRHsTGCSkhPXdYWk4sDr9XzkNn3wL2Zq4onqC5COrdKdj6LKEIQE1T5pg5wCv19qOcwT
         ffO75QdADBaNu+GkHIlv0ZvRj/baZtnAbukzj30xlwtBer76WKHgQ+bJzCTzLyvOJyT3
         +TkzBJoGU4eDXCuFrC1r3bkl4J/BDq3a9+HMxNH6Nv+mXIyAVrPUch+hhkkUvq05AWyP
         RU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498876; x=1796103676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=J5QgOg3gQwSZ4vqu74PPFOKMrLhkzBox/NNrZzRv1FQX71dBVXv/r0al1MwklT/lKm
         4DlZtQVBNj2cgUoaEL+NHmF8CN3re6QPxQBuBEXmqsjohvg2mR74YCXTF/mpHscd6R4I
         Vaj9oQditZlVI0mSb+V8rG4RXiIYKKM28CfoP2xUBlWCwLhCROhYL2m7mQX8f0zpl9zD
         1grGur+/ZWYLJ0le8npTgNvrz/IUHW6/YNH2LuFKAmEasmDRYPOc3PLcbHdpxtLa9MYg
         BCuICt5dMVi8MM1A/2MqtHNp2kiBwXR+FZgoOX9T2q63QOWzY0/+39Gw/SLyuupECymt
         HARg==
X-Forwarded-Encrypted: i=1; AL+hErFBT59D/n/EEueZOHAwglHdwsk6ellXZNc90jSkXRQn1a75haM0UhxVZjm159Fq+Lr+fl+K4qQ6XxVJ7SI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xtP71Kt9z9g9GGiaBSt74AD5P/tXX3XVstFH8stYwc2pcRgAV
	yGlwd9abLrCyZJdLlvI+qcEd4pqM90s+iPDfxLd3jHZ6TeLaxMwL0OB2tWbVWREnGhlPZURUG4w
	XiFf/o6lTd7aoHQNzl9g8R5WuyUOmrDDrmiCIwMPkLnfwFbzkGYYRBK32wKeAUr8Sbnk=
X-Gm-Gg: AZFdTZfunnQL9CSOYRvu+2t0WMCpJG2XLQAowuZS4WCBJoroQ7JLerMiXfXGZCX5DSj
	OYN1oij9tgJ/H2skmLyUVysiwZ43fkKYW2yyhLiY9QbN+MrbpNzdbNynPV1f6hw7W+MeuBCbAai
	2EffvpP9HEJQcnv0qFzTarUCg2QfONkBQMyPLUHUR7FjRDxgZhPe1XUwO33vXiuCYCCp/33p1Ve
	Nt7fgKiMrlT48whbWTTHfPdIqZMomH1HAPjZ9+Maw1nYVtuT+moXZ7QtPKJxBrk3+RSXYdVn1H5
	ufh466+FKMkCWPYUcs/qkbB/pOtWpekMF5suzmoMaviV6bsg3icx3QTcJoh/jS1g+Pe0nsMdqGk
	xOJqMguMVoCvJVY7TEO7FGEowKmsd3aO/KOA2rPmzMB+6rsQW+kZ707+fW5/3al5o
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342713385a.24.1795498875709;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342710785a.24.1795498875152;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm484009905e9.6.2026.11.23.21.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:41:14 -0800 (PST)
Date: Tue, 24 Nov 2026 07:41:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <rkyw4fpc6t3jwgldvhgbos7ocbz4m7ux5xn3sc6vobm2l2yrte@vdb5gjsv2q3n>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05237c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tWeuqc_IvAeSSrr3ltwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: a49XvKHYWb9AQjAj0d8q3n2scXsROvoC
X-Proofpoint-ORIG-GUID: a49XvKHYWb9AQjAj0d8q3n2scXsROvoC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX64djN01u0KTX
 6jRjNXOAom+ExbJOCf29qOvtNOJa1ndxxhslMdmmhAXK7d92hrn6CSoMBm/+sWfkWgKQzDUZX8g
 AK+SuDKpVly2QQN0yDMzusUnGS8cNXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX955Zxkx8xtGV
 u4uECoB1jgCU2xCxVNHWdKPKBhhwv4/OkUALivF7rGUyL6J+fwKi4MQE+Svj5iPZCQF4qGPsXmr
 FsWDT8STGSK+4Zy+Y+G+s03OzIIaIx7U2g1tlr7FyqbqtrLn/qX1eCHj0v7OmEZ2UbpcY+nVwgu
 ooE9uE9LeI3S6qvR47hpnMeA8pmCOnPvESjRDq5ieiQQiF3Mc/Qi0sBEk94WKhFqkDVOS1vG3pm
 D+50IxuBkyIwQBaWlHGhmEC/DVxmxR91jkqOk1GB9yNc4V47rhkfEkCM68Itptwm3eKQ+kJmWWr
 lAINUC06xbi5isO5GBW6VBw9NfcBuja/8cIhNgZBfNL0oORh1CXcq//OQwXAcF6tSlGGoTgkDo0
 u7azflWP09Bu2ZyPPWqv3nO+hRYPHWsug2hLQcAeFXdkC/006ccx7wqpLLxMxNuBlxfoFjyVyoj
 3w0Oh5stYo1OuglOO2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 22:58:43, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
