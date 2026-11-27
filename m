Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790626;
	b=zNGYsqTmAP4hHSQPi3AC5+TMiHxQ+YQsNNVnR6V8jsYWfBRDy3/BqHc3K7brlxep/Q8S
	 ZavoKUSeD4FICaTv4NjqKXqhxMx5kSudH2UQqGbb62JfYHSBDpPJlilPsMid9K4On0oJl
	 miGnD/1r7pruQ/LrvOMRSKJhvRGWnzzNO8peSLghTXHZuoZuqpNhfJWlBd4Pa25J+VRx9
	 G8Wm0Brk8MtKeiCNxRFgSOAy6TF9sBCiarPviQa160QlnBuXYwo5tObTrEuLqg+MfRzec
	 B32S/WjmTVi6yMBA3NPrS0czp/YxP1xaq23RJLM8xHgvJ1dSe73g8xFgc9zA88AXRqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WYwRYvmg1yr4hFV3xXwX6VX9Ocs8Qg1v4HgcCvCbLoE=;
	b=k/7OS6Qa1+nVUx06JTXNzHJ6s+Sbj06/LGiZHWtme4u7q6KMxJ8uk5YD9zVfw1Z6JZuc
	 M8Wuk2HUQFln/UXgF2K6vmis8uNu7CbV8V3h90MPSGJOZmqHpQbNF/IQh24N2JpVImgLq
	 eFaI/WG7jisj3KdWX1CVf0R8RgGkmtQLUVQSZ+YoavJSP2pYFV42BvyePpqNZdllQz/9h
	 3lB5yBNFwniuuENqgPMAf7dCH9fXAzBK7RFZRzaXKGakhASgkpXEXMmkaPk4rWByy/Foa
	 1thrq3BBct7+DR0A1pa3W7lAvIRsLv/noyzVdP90aH0BPW2rnfk4Cvta5pNGMLOpo8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiuwCcmC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R38YHaMA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D396606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D396606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiuwCcmC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R38YHaMA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1dlh1971467
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYwRYvmg1yr4hFV3xXwX6VX9Ocs8Qg1v4HgcCvCbLoE=; b=CiuwCcmC0Nw6ivfM
	V314dM28Chs5bIEhdvdUrGJCifYOGvvRP8jGtT6Ultns7ncjT114LESxPipJ8c+J
	o7y6IQDKVhs9JOYOnklwGbGNVAhdI7nGAMFCWdb6WYY2HQOcTC9/zrqTLr9sxKiX
	t7WcTcZXzHrTRXpRpqVo99eyZz0fbVM6L+rMqG4PlnuJAVqy9OO0nfd7TJ1pmfqQ
	sqyH7Vq+7nEgQL1O4JduIcXNtmDT9RXX6iKolu3Lr4EjWFUwfo8h6GlATVa4AOlO
	wewfBpN7zE/pnxUtw4QX7j2vSr4E/76eWpzm3KPdiRXs9+7uVOmY/FVAtDgFvw0v
	wbaxOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55udwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4b76a2b95so5798070a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:43:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790623; cv=none;
        d=google.com; s=arc-20260327;
        b=k7MTqItEzlGhrsE3OJas5WPXPQaHlgJT+pwtajJdeIwhW59wH3W1WVo2uWb6zFjOFb
         ilRbV5562B/yfdfnbnmgdqGAw69m9Vauoi/X6tTkAthbJQpQxO9Nmy99Qjaja1myqG8e
         o1g9096wa60vCFhDsToXdfcRnXMT4Zl0pvB43fmOi2QkAqfZKKZoucP+JKwd6Gau05CN
         WSduZZ4Powk4Y5v63OL1n7e+eQ9hyS5K9uiPOuI8pq4W/DlrRUrrT6xk9TF18DsNpVuI
         9krDWpqDEPA0a6N9RyYkpkPYL9tGTq6YC6KXuLx0Bsh2x7LUey8ZcOXMBzrBh6ip3+wC
         pdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYwRYvmg1yr4hFV3xXwX6VX9Ocs8Qg1v4HgcCvCbLoE=;
        fh=YIwDwDR929NBfHQPo/lKvDDSfTUQutTgHC39gaOEa7c=;
        b=BSbylJyi8kS2h0KWHGqhyjxxvQfnKiwxuMRYoNxwMyOdzot3i918d12joU/7ukIPql
         JCkTIGXTBVyiQbZd7e68qahVuKGLCDe6MvtSrJ7k24aTP+2RRFbLvNpqRh8FQ6jXKqmU
         VrA0sTL4Df7luoHdc8acp9cuKYcoVNGYxKbgng6qVR0KlXCplqC06DYB9Dea7OPC9a3I
         PPfj7fxOvTrXMYtuajVowH5icFwTe6NzYw6xeJu1hkRVs6DOT19cxAEVsITyciQt8+2n
         Jm4Q7jiBjWiUTLGBIFBDgcGSkp7GvPlcbAWEwn1XUMBDIqDTsA2StwVZxTvaXh3LhGuh
         n+Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790623; x=1796395423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYwRYvmg1yr4hFV3xXwX6VX9Ocs8Qg1v4HgcCvCbLoE=;
        b=R38YHaMAjBXNHcsgHJgxFblJfPczZ7buURFvLLDQOuLY6BOBnneYPoRX57McczePFA
         /e7Xz+E0FTYgyEYg8pp2f8BLz06b+NEVt0ClvsXsSh7DIhhlhK3PqIs9Et/J0Rt57hB0
         nTAMQeaY7Z/QRp0jMBPGBR/ldokEd5aNQY1xfOqi0qzlSGWzQJAMEI20wpKsPH5MVCIc
         i9saTl+QwwS9zDU4OiA3Lm6+UHT7yO0i5ZzfDjofWnu+Hx9xhgsF+xXpYK4YXfT7JzfM
         YujHl5za/1nr9Bt9YW2bw62AozNcshyM1CyV9FJ6pMdK6zOx5+/MBHkQk56PBhj+Yw8q
         PhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790623; x=1796395423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYwRYvmg1yr4hFV3xXwX6VX9Ocs8Qg1v4HgcCvCbLoE=;
        b=G7HHBfHuaOHDxpNHTDVgxsVjx2Q08KPOT/qoyHbpWwqNf71aDggmXrz8pF5VDwYTW+
         btVeMXYvLMsaxvhZ6pWTVG3F/tRwk0yKQgZ4zwtqlLYA3BpULrFvL6arV9j3xvy20DOX
         uEh5yi1/5ZG6Me4nm70dQ2vlHADdyRpSNWvWHHm53L9VICCGglo3wiFL1O2MEWkNNwpw
         7YSDkH/uAe2WHLPn7Cq6ASMPX0cbTs2uik57wGGBLXtHb2zbOCPgQnmXXJJVyj9UZd4V
         8YVC1qYOzhO8rkiBbMD1jU7i16zLS95oP2AqmUg7kfxs8zuFd5R7GdOg3Kou5K4jtFgh
         bUYw==
X-Forwarded-Encrypted: i=1; AL+hErEJCNkWQLlKP35MhlLlxGW+y825YECfi/f6IlVPOng1Juj0NazRzF5iigoE0QDxzfHE1t6w1uvVLmryqV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/61wufJJ2e0uojVEotnmSbINcteqADv+cqsg/qAMQBse8/mgxB
	ZYJPI2wH1ArWsshKM7dr8KgKJu/gfNAoBU48fXORVEtc9kctMP06bpxFG0jXyFZof5hOpbL/Hsz
	tunSakfIEMeGWlESJTLwbyhxTmEt8CVgx2p2tuzO0k6tXiwQXBOH+WkTVuJtxheBElz6LsUM4Iu
	zHAvgkpXWZRrAWBIf7cR1KIFnHoy5rOYYjYi7dW2tBqw==
X-Gm-Gg: AZFdTZe407+zdcjk0aaLDcRudNwZLxrTQ2zmqDXgrF+yhEzrggAFwfx9CS0xM9BEY2J
	fUO9uLKUdiACDZ9gcSt9NqJTvlwfH3rdBJ9MtGURvvRNCmi+FXk3FwOhKwfIuwKpHgG5f29laUl
	qfyStlkQ4Qx4zXpyn5nWaNlsnvXeAKgHhfJrmZeY/IDie1GZ0yesMFd6d/Lw==
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr24623435a91.1.1795790622831;
        Fri, 27 Nov 2026 06:43:42 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id
 98e67ed59e1d1-3b41c7e119bmr24623401a91.1.1795790622421; Fri, 27 Nov 2026
 06:43:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103192345.647483-1-kernel@picomail.one> <20261104054412.8310-1-kernel@picomail.one>
In-Reply-To: <20261104054412.8310-1-kernel@picomail.one>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:31 +0100
X-Gm-Features: Aa3M54qKOWtbP_f21x0lELCetsrIy47-wTE7FTFr0KH095P1fDzVSPwkO9ID7uc
Message-ID: <CAPx+jO_6CVfC+JsieB+u1z3R4b_D7GcOX8anXfgmBtd6MoozRQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: core: clear MQRQ_XFER_SINGLE_BLOCK for new requests
To: Jonathan Schmid <kernel@picomail.one>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX9OkXjtDPhD4c
 dhHOPfKt6f5fdG/A4tUkzyBhVacHmkOT4FXkMmw4jhfmyV6s/1IYERbiD+lSovsRL7BBj8plV//
 OTXKf/tY5lJOi53LTS3qfReuQ5EiItk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX54tbwQ0fOJiJ
 b7szj36ZG4GFohmbynq/UhF4THeZ+EMR8sdzLqWco8XX3Mh10RQTNv4D/9G0lkWcxcjXtucXU6n
 kXSKjtPXyrzgwMvx25JAhRnkKwrdKRReoJ5xc19te9MN64HF1eTAvvykORphW32xsCbdfBQqaah
 pzvuP44WAoBsMgyJmqV9iTi4RoAJFQDvqZ2J5h9oGguDJF151/Xqm+WC+fRbJ5HC2mGC0FpjPQq
 0r/Ajc72ndNQMs9hy2q6/njfeqOpYb4BiGRsx4IuGdUAQo6IlRlK6S41Bf5XrGfuvofmCbel5rw
 b4dYDc68XbE02wyAGv/Iv5/444WXo9FGL2WLv0mHlH3VBE2JCHUtSEGKnY+wUI+/g9JQs0fq69r
 n726taTTwt6olz60oYI+x3M14qFPDyyK42fWm/YcyClO8hAMPXtZ5I2HiHT8/OnErzzppp0snCN
 gsx3H6LOwaXKubqzu0Q==
X-Proofpoint-ORIG-GUID: 9Vz-hAXouTYZOrHL1A42wQ8fScEXAX76
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09971f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=eT9L358XsF3sCvS_DZ4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9Vz-hAXouTYZOrHL1A42wQ8fScEXAX76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On Wed, Nov 4, 2026 at 6:45=E2=80=AFAM Jonathan Schmid <kernel@picomail.one=
> wrote:
>
> mmc_blk_mq_complete_rq() and mmc_blk_cqe_complete_rq() set
> MQRQ_XFER_SINGLE_BLOCK in the request PDU when a transfer fails, so the
> retry is done one block at a time. Nothing ever clears the flag again.
>
> The PDU belongs to the blk-mq tag and is reused for later requests, while
> mmc_mq_queue_rq() only resets ->retries for a new request. Every tag that
> has seen a single transfer error therefore keeps issuing single-block
> transfers (CMD17/CMD24) for the rest of the uptime.
>
> On an RK3576 board (HS400ES eMMC) with occasional data CRC errors, which
> are recovered correctly, sequential direct reads dropped from ~200 MB/s
> after boot to 3-10 MB/s within minutes and never recovered. The host
> registers showed only CMD17 with a 512 byte block size. With this change
> the read throughput stays at ~200 MB/s and writes at 60-90 MB/s while the
> data CRC errors continue to be retried.
>
> Reset the flags together with the retry counter when a request is
> prepared for the first time. Requeued requests keep RQF_DONTPREP, so the
> single-block retry of the failing request itself is unchanged.
>
> Fixes: d34124edffdb ("mmc: block: Use MQRQ_XFER_SINGLE_BLOCK for both rea=
d and write recovery")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jonathan Schmid <kernel@picomail.one>

Applied for fixes and by re-adding Shawn's reviewed-by tag, thanks!

Kind regards
Uffe


> ---
> v2: use my real name in From and Signed-off-by (Greg)
>
>  drivers/mmc/core/queue.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -301,6 +301,8 @@
>
>         if (!(req->rq_flags & RQF_DONTPREP)) {
>                 req_to_mmc_queue_req(req)->retries =3D 0;
> +               /* the request PDU is reused: don't inherit single-block =
recovery */
> +               req_to_mmc_queue_req(req)->flags =3D 0;
>                 req->rq_flags |=3D RQF_DONTPREP;
>         }
>
