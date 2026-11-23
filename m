Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448201;
	b=thse7xbJhbhYGVv0YSON3JHi736rXswH4CegFdUYbMLY9ukZdaUnaXhDkFenYmLf4is7
	 S9zhGyp7YKIUXoF0QJU80vjF6pN1Q8YA0uNI9etCBtzYqW+JiBALNTw+Y4kdAOasSMA9r
	 I0rearlplvgLYmy4H3aRlwjmFERXLrS3ABA6v0zRi19MOzJLoPgL8d99vYZARnAIQhBjP
	 5rsFdFzf25go/k7/YfVjGlpohL3FQ3PfSHSetjtNCpvx5osmByN6z3Szs73WmlUMNiPaZ
	 ck1z7quzkZ7CPvyIyD0oXLR0XBTRFfQCBSMpLQsrteC9R0JQgjBpwHA8bRjLmcyxxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
	b=ydeCsXnBh35QfdhRsKoAWFbZJY2SmbG/KGknz7oUF7lBPBN4XrjgQR4IVUgT73HJPr2U
	 N6bsP7VYYj1ytxRH9JPRuRTrvOwLbrmTPPIm5g+jEmTu3WvFzTll6KfDiZNTMmgMNfkch
	 bJhqDNpabiDmtZ5XVmA876nEkqaKKYSIjj/MR3WdRr4Es6PEfO+HRF2m0+19SI5zBMfjs
	 9uR31P/bKlT+1hX46/NF0fb8IWAcZu+nE8GFCMoZUGNbDLCJXWmgoI+A97XwwU4FoLC0P
	 u/CKA+2I37tbTAj0v2vX+QoppOsK7L87AJNzTrGo3WZnaz9/fa9VJunbpvMhHbkLLIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHmAIdAk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAANYfAL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56583606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56583606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHmAIdAk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAANYfAL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKxe82369228
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=; b=JHmAIdAk0Y7K5umg
	MotVtHTh0DtNfje87OEo/VTXdu9dqbwxVvkz+pnm0xqoSQZPchLOeVQQim6sTkGV
	2Vhi+JMU9hNKME9fVWEZ2S6gpTRICyf/arx49I9vYwyKdZANTOEacwe3pxb8FB/9
	MyIRFsCNvYNvRrAOaSjS4wQ6HDX1RH+OowjKVqv7Ng4+L87cgz33Guf2RzCicNz5
	/tG0pXxWTD/kEIO0uJb5Rq5ZHd8c4vdNDYI7JLsSSCU4OUYlozwWDlFSPWpmbxGB
	w7hc4jShv7iZ77uZDYGWleC/zLhQAq/AAcJPokiG35WEvq/WhgEwcVkFocnM1jLL
	phOAUQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa2vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:40 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b3b74c495dso50863297b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448199; x=1796052999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
        b=TAANYfAL1pkgr76S4qvJTLlpZGRqRd6ZVx4uRWwl0/00G4ioGnacuMjhWNtnEVDiZw
         Ue4ASlHoRLm6YISfW5Ou8FhPyEibXzxXK6i9tOvnWzh4XLxAeen/T0xh2+mBq0QsXwYQ
         q8VMDniACdNrrPNfovojoXQd6kKezqWVZKlBUXfD/u0K0wN+xqmGk27wNIjBBGmq7ne6
         wQvPqKFpVmwYWPiAFgzVpOTinx4DdKiQ7XcYbByyAbu/oLPpx38kJg4MzA5bcCFtzPuw
         AjUT4DNJxlm3JhSRCA2/bFVqOgBu+r/RemD7Ggw0CQXRZm1JioqDNm5lVhw5vvUNRRtb
         N4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448199; x=1796052999;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gScytbF+qOmyDYowGg9wfSJuyHZnnii9zt2QzkU+GlA=;
        b=b1mtnFUCHtJfp0YICsGK/uGI5sCIAMig0Q/oJRp6vaoOfhbqJG+3lXxGyD6CBC3/4H
         Pj3T1l5CpWOlkeCIUiV+dst1ncVQI4Cy0RlqCgprcij77HL9/lMT2NEUUkAhXbQ2Uncd
         otumKzvKMTZbo9ZqUw2drARFDSBTkYmDF0W0BaAFRTLl/yqQCoWXkfs+MjbVfebaBLvo
         RicOXqA+ua4en5toxzkWKGewAWmoAvl7onokB5PLVJMISRVIAiLdSRpdkXQtQXv6C9Mo
         KYpQikTYf1RAaReBAzm78FDPGeEG/F4y7khCj7GsM/0AysSADbIJtMXruG+TCLADYVSW
         9cqA==
X-Forwarded-Encrypted: i=1; AL+hErEe/uu+7EWzkRG7nTrxPv5omfptWNHqUoXgNVgsEUFpiKizGY4ZaHS6DH4vpzHxpNNloHO14d4zsC0AjBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SxIrUqZ4oyqXkcTl1BB7BuJTd0WNQ4l8+0XknttDE631qb3E6
	jDFPmVsCBjV3pdfmkAS0FeTifJEie4B3hqdvusQZSfMNYyp/y59gOj9HFJ6YssIJd1bumTenQNO
	9iq1tUSmlaCqsGSTjhbaEw6vtriBPT99oxVOtm0J9s7iWpv/XuVg8hP0mLFN2esSmz3k=
X-Gm-Gg: AZFdTZf+HDzg7GN2Vf/fTrjC/FGtuoP9fjTkGxHCYkuLS4rN0E+v1aDMyL4RkhEl1WI
	zQesScOaE75vj7PGp+N8W0uhnTngivPBLsoChJ6EtGNgO6Gq4OQgXod1OdBesTxJ13dmATI/FDJ
	56GpeZbBaMCdaFnCr5qlUdTWGI08etYCsL3+TkeOYglM5+DAOSrcZ/FqK8oLOkkcyiJfcad/Az0
	+JoxshkANogmVjA19Wl7Ch1rzKIA7oJPyHIRn50qtimi17Uo2GdKrWMuROdzggvxelu6yEH+PZF
	cE7nEwvnIzVlIkNfeTSbUb1C60yv4ChGC4d6YfEUTyiPzQpWNPevJKeMo2/+sgGm/mQIkvVU8BF
	s/Tk5l/942WDOhVXrVV2Rym6fq1D3WeU1lNqYxUO+lPj6tXdScU2FBIVLY2jFXaY77GLd/oLc2E
	noBj72D1bEglIlemFtlRXX232aOpM9I8Ha2gWVSPrluRkWytdXvb4LdlAx6YdczQ==
X-Received: by 2002:a05:690c:c9e:b0:8b4:e95f:d20d with SMTP id 00721157ae682-8b520435b7dmr44457957b3.25.1795448198773;
        Mon, 23 Nov 2026 07:36:38 -0800 (PST)
X-Received: by 2002:a05:690c:c9e:b0:8b4:e95f:d20d with SMTP id 00721157ae682-8b520435b7dmr44457837b3.25.1795448198396;
        Mon, 23 Nov 2026 07:36:38 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22903514f8f.41.2026.11.23.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:36:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
Date: Mon, 23 Nov 2026 16:36:35 +0100
Message-ID: <179544819292.86961.11905467964163223654.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
References: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXxa8TrnWh8dEM
 2gVIyJX5Nz8tYYcTmCWusdMyYHggidQuRnJcuEVDmyuHrRXPB9swrIIIHOepwITLQhs3t4XEpS2
 SC63SME880+biUynlWTVShW17Gsio+tKx/lVr9ejKnNddws4wZ3Y3usOmp6hMZiNRMvPdBBo+8b
 z+up6vqnlj27AQqmGLpIhj2LcrncWm/cyA799uDYIk0ZfbwdwrAzs/V66SHnJVhKBa0Ps0rty78
 fjUwtQhSaAO7YZRs+gsRq5A7UeYEqmir5NObCJJ7CBiqFRYfVKCV5ol26xip1KWzZCGkMxxgc/u
 TfKKnfQqQuIiCJ6ptxoq3HkDmkWmPM6SfIh89eLADrWNF1BBue7EBnNmhnr5eQQ2k6fxwPrXDSd
 V7Hg1OL5QQpULtakgZqaYx3vqbGr+Q+ARpbGRpzzAej7QAUSUDIYHQu4gBcw+DsDVjrQhCb7guf
 GHl9v4qj88GG/ndc1ew==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045d88 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q9h6UfjCcGEWxBkGLjAA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: E6dkGdxo9439wNAr-_eE7kxk1X9S-TuB
X-Proofpoint-ORIG-GUID: E6dkGdxo9439wNAr-_eE7kxk1X9S-TuB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXyQ1QAhrqE326
 VP8dH9PV6wkoRAsE0D5O6v2LeBZfM7U2u6DC/H8DpRR8gPZprT2VnAiMBQxyjFRev9dBRL6qhln
 n3iwTBpBoImYDlL1/KerX+dMA5v/rjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062


On Sun, 22 Nov 2026 01:45:27 +0800, Chen Jung Ku wrote:
> Replace hardcoded function names with __func__ in the dev_dbg()
> messages to fix checkpatch.pl warnings.
> 
> No functional changes.
> 
> 

Applied, thanks!

[1/1] gpio: amdpt: Use __func__ instead of hardcoded function names
      https://git.kernel.org/brgl/c/0e1941b7d0b0a0405b16567678a9bc3b20be6340

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
