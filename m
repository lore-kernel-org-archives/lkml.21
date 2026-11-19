Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102247;
	b=WbM3df9hu3EACXQU6CcJY7I9aZ6h/lUY/EP6TxgHQPqCPRQGAoV6jTO2DYl9+ccuzEFR
	 AWF1j83FQ9GOOaZ6yJLVAiq7NZkayM6N8jmiZVdC1sTkYL69qqmtSgMCzYAE5SacXQh78
	 fwTibCVagPAQeS6DjYTa7UAtds6rcaZf/pxlPyZwguJS/FGgNaA7U3+gtUJHLHFhAzMie
	 4EMzsRI9bHdMKv/0T0anMzGuIJsHYQ8kPDHNtRUgB4fj3VdDunDDp2ZxSo3HGAVFf/0gB
	 xipm+XGRt83lwBEpCgq/j/cHHdTICEpsKzsy0ugF2V9cgS91tIHQ2Rlq+H4NcZxx0DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
	b=CtpmRwyk4jDXObqlpO90v0vn3qGLlMcCyDb6/Si841LU+M6Ga7ir0EbPI4xp5mhUxYKl
	 3mxXDI651/RtXPLEFkykCaX6vmlAzJjlDcFGiwMphD4ZFFrRhHJtFL3uJiw+HOFqdu2i0
	 /M0hvsoRWt4rJuXb7Ke5EHWH5KvIhxmzbTwRK5a5aDukdt7GC22CPSBnBRr1RWcVxbnqb
	 rwXeXaqAY/XPtUrrn2ozWFQ702TQg2x9bE1KUndWDu9ecbHZAZcpzh4lr+4rqQLtS86TI
	 /HFS9Gx+ntJex51HlITteKUXb2IujKAN9EWwWyYNdqHrd48lyjqmOD7Tzkf0UXOgikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE36606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE36606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6T8O1145635
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JDnpOn5OCiSx6f0pLbaz7y7d
	NDOSBAwzbbFSOhKoCsM=; b=jdR0S3NP3CDw2weUvX+xbH+OzPbLEO+EoQtdhVMv
	fCqCk+8HQmsCRIB6pZV59ZHjFwvwx35kbo0A+FJGYN60TfB6JtZPDzDptfFPjF64
	tNbutxnk/dUFOtDtJFNePcT2NGY1kWGouZJgUomFy/D0NxIuabI4Vn4LfKEbGAvi
	f5WuCnfAKn+S6AayrKejqaDS2KCNDGcrBl+D3WxfSPh0ahKocX+pyL+inC+Labmk
	XIqQ5HbDSAJspyIKHw7RRAtZR9GYW46R5nyqgmqqiJq7TNNme5h7KZfMBhrbm3Lg
	jz6p74AxwuQ5nNoO2tj2oDp8rmBIlY8A9a5JwCLKVjEV+g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x709gyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:30:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so651634e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795102245; x=1795707045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=djj2hMfoc+MAoyITPNWb9uoUa6mFaXQaZzyFAaB1YOumWQHY8ALSaA95RGQabh/Cle
         O5D0BtIfUsxdPlRwRM4yh4JKPHmbHWTxciS7q4O4H5XgOeAV/iTitBtkXCxfKSwOax40
         Kcr3pYFUDsk3K/E/Xs6efIM6793RlM682EJWNC2fEmn6k1zEbXAaSsJ0gWn/eAtwwRF5
         tHrgTHiaDiOs0/6mIeCkmVL6c3wecX8WCAZB+3JkM8+XuX5kX6jaSh0omYpMsz0rl82e
         6Tx0W+iRi5KMPKhLRHuTrtADohaegZvWvCknY/78nCleslqktu4voOAwrkHIeS9mNs47
         Lekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102245; x=1795707045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=VQhHfkbkUII7tVl2SE9vhiunllEf6ne58XKE9g1PWVHbJjkXv33DGzj7fAnLIcwoWN
         3bUa904x3v4yOwd5NwziTPA8AsVMUKla/bWznUHcnOs0W5FDdgIEVUctKCHzj8gd4iAt
         +vhdDHm0d98Zse+26p+X7YXMVvVJM/myYzxXX1H6RDTzBMogEG5GwmrV/VJeiASOGGE8
         Xd8n3TSo/dW4hiWZgFaI+4gm+Lsk00iNU7vm4avFgbJrAa955jCwmGF6D44ZDwUZuIRK
         urYPTGgAi2eksDuhPB+LSAMGuUMytW8TlS4/lRhp1fKq9WhEcRE/fxZgXQj0bKUtRyFf
         B6Kg==
X-Forwarded-Encrypted: i=1; AL+hErFz+QR9f3KH65LfjKKCkot8zv7FFycDyzAdaoYTWam6ZHsSqHGzGVDZBjyRbA8bW9vVjAAgnaQeJX1ZUz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mnFIHVkd8EaGl7gjuX9MEv7T1iAR7yNGSycaRUdHjakfSar7k
	b2mz7l51wbsxNlNctoqVQX7uzokBGZ2p93uXph4Au98MvJxetFhQeiA8iRhZJXnMK93N1NfQree
	jypiPNm4bvSvzEdyjbfTEj8SveWcM/t3F/SLdnw1zH5VFconVYoIsmsal/pQIgXonBCs=
X-Gm-Gg: AYBFou0iYRh95yqaakdiUsB8vxxIp4O932iJ4e3MG+KdvSAt11mQkgTU1oKkpl5/hvI
	bk9JXrA2WacyRyMK69XYTJfSWL4sBXuPU8zOay6spt9yKZMUyXvCYhTE9kO7ogtTqqEAnqjdFLU
	v7vrv93+6zXcEkndV5HbnEOqiJCaXEbLWGy8HSkwj8AFrJEPQZqFlg00ZXFSFt6w5sFrJ/vnZow
	k5MpPuBMw+U5QaQh+XO7EtUYeuCfOMgFVCA9WCY9RXeKCpCh4hTNQTsEnn5jcvuHXsmoNDZP6Cf
	jgdhOBG3JNcK9XRCLCjNf5qegXD//f6qe1cX6zc7GMUrNF9fYBr+ZPgmTlYIKBW141IeRdgoPTf
	8PNOSwhRP2UD0d7FZEWbSGyojaMlMfpN0zVLWIgHDsZau48sBbApiCPo7vgBiWi5WRmLlhM/5tc
	pxr3Bdfkr+4jY=
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5863e0c.8.1795102244709;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5775e0c.8.1795102244005;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm75672515e9.2.2026.11.19.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:30:43 -0800 (PST)
Date: Thu, 19 Nov 2026 16:30:41 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Message-ID: <av8WIZjPgnS8qWNt@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
 <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
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
In-Reply-To: <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
X-Proofpoint-ORIG-GUID: HyQM-S3ZY6X8cWPLnXoz_jwxk7QLSLYP
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff1625 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bQRtwVpyhJfczlGs_sgA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX/icEpxDb8x6C
 Et3DPDN4aMVvboyv+/8H1i85jzqqWGOKZsXGXLFRb6XFyM1HwxPAAIguFk8VdqZxIgUfvJxVFcZ
 22dBElbriEfeF7SzkZK+Lc+kJXtcZbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfXwf4xE6GKdDzU
 YKSVoJKoTrFcSxnEonD6QmRkjyccfzRM1Tp0L9HK1zWit6vY/D0gTVASqvQ9CMOPURGEqrpc2XK
 wKe99vwy6Tpv+EH0Lk07J1Mcy39Q28HTsjJYEFUpwftb+l2rBjtxMkhmy/CoBH4FtnOSQUygnhE
 WzpJdMXTZN7DHchM0kk7O28VV8DRuVtsX1KdavE7CL0t+ghgoo1Jw8J4Tk/gyR5do2e9c8GR5s+
 KLUM8jWUwO4E7GGb1XaV6aq44e+c953duXqDIawc+B0LywyNSj6zkZZ6NEm8EQcFrY/ajb9BYff
 TTdJIRVwnADtkDxg7dwIzD8nBrANftu/Z/D/SgK32Jxow2TwhtkAUUUjT+DS56vyInCKQSNq1/9
 766ulfihAD0oTjWoVZ6ziX5jJfgIN5eA3xAj3AVZRnRT17T2rGAswgWMeNRDSxCI0ap7bLkubYY
 iBS0E/hZqTDowSuhfEw==
X-Proofpoint-GUID: HyQM-S3ZY6X8cWPLnXoz_jwxk7QLSLYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190061

On Thu, Nov 19, 2026 at 03:04:11PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 18, 2026 at 12:24:07PM +0100, Shawn Guo wrote:
> > Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
> > I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
> > and 12 into the uartN nodes instead of their spiN siblings, and left
> > spi4 and spi14..spi19 without any. The UART nodes now carry dmas
> > properties the GENI UART binding doesn't allow, and 15 of 18 SPI
> > engines can't use GPI DMA.
> > 
> > Move the channels from the UART nodes to the SPI nodes, and add the
> > missing ones for spi4 and spi14..spi19.
> > 
> > Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Eek! Thanks. I think the comment from sashiko needs to be addresed
> though.

I think sashiko got confused, no?

Shawn
