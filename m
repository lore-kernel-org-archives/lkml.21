Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563334;
	b=Pd85nrn8n8Qr43WRuuL69WqHt562jM3wC5Bj5SC9AXockxi9W6WiH0V95TzEtwWxWxED
	 Rl6mRIH86gwFX6CGnEDwQ3RB8LZEj1KqP3J0U0e8KJ6Cp29tf9DuxnMe6YK2dhVP6JVv6
	 EdJ3GZqWqiqGG8qxkk56CNZ1JHSw4uAml3ouRZ2ZlykPI5Gop54+r96Q/IQ1iWYuls8/O
	 bjpdt1nUk1r+JyY3dN75BsaVoJbccl/yfuPZtXLLRfRgXG6bA7mTGQqlgz97udnhA85uH
	 93As7v7UQlS7ShqGQuvtptYHJ8AVBHw6n4Fd9Kn/y1UhE+fOaZIV2xrnPnNHhB8uO2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=;
	b=aOHFSrkaMpSN6nOWHEgra5o41ABDoLHVsZx3ZgoCv5gI5cey5FgOQx/Oa5LDsFrMni5Y
	 Z27agEbbxfANgrLUnvUS69FPGwvPoJ57fvSB2+Wk2p/IZZ4XIAIP1UO/w3Ng0WU4c+i+8
	 uAhZHtiM9D+yfbThDARf+YiE/Hh0uVtT7muQMGyZJxwTrRsA5KIO7JP/4bDthf3j1+JS8
	 EE+xJS6H1dmEIlOdXalI/3rYvNywruE09BJX/l+R/DpXPk0dXWMZpUKg7aeh3wzXMC4h2
	 R+/Vn5EbkFjhoM/Rd9rwMUteMpYmLIDGk9UJjmwvsXY5hQdyzUALs6053N6Fv28FNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h7oZLOCc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+emKAFk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB479606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB479606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h7oZLOCc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+emKAFk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMapmV640361
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=; b=h7oZLOCcrIy30Hao
	FK38iZQoYlkyepzI1JsVsRVxonG3GDqwrJX4tKCSIwWOTk3CMlfggGOezcsmYSNB
	DEGVFdJYPHawCDK3yfvF8sBseXvM7o5SOpDT+oBPhUVX60pQ23zUYPoe+xg7U1um
	PnwJzgUyaoI7Ca7AUBeVme8MJbxteoLp6/U9yFNSCYwlMMUOeUXwH9ehwTF3dcFI
	Sql0M6UmxnVC3bbEYdqcbqnhcA7tpUOyTTqx5iEBJd0MlbTjFE0o1mdOT4TttNSZ
	XaLNeYGsFTpXOAIuwKWORHgkG9oYFRoUN0P+2vX066bRjUg2rYVDxV6Y/klkUJPj
	tYI+0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsg4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:35:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so4825515eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563332; x=1796168132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=;
        b=j+emKAFkUeacQNOPXUze3o6/SWf6RcV4tU0eHxRL3Pj/ojRdSId75/3qOsZUopWB6s
         X0Mkyjap0L7O+3jyheEMDSJxa4zL4RE3vs0uQE4Ioid/ZaEXcREeoY2uuILnGpes3UnM
         5vZTHgTGWdTUGVUOrRh147SVj5Hhz2fPtdaD1mpTDh2V7vZ2OytX6AhBmDF2FLO1/vs8
         ZJCgFsssHPhxL6OwkqopDeCTLZfSYPDzbB7Pk02b7HV180V9oGIokY1w9XisadmrZ6dJ
         ehOJ4LNn/tQ6nMd+41WlfLNaWysBwkHej8t3Epsm8nYPZkPRTwDxfaTWCq0cRGJYqnvp
         M/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563332; x=1796168132;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=;
        b=R44CE51O6G/n8udBqz4ZJnWcNojsz8dePSMqQiMqkzDbtV6TekfXqV/P3e9mBhvW0T
         sP08EdVXDQlhwtYQhZtNdW4eCPIQxBC18Yx9Ok4brczo4rQnvXZIpuejMzTr/3QfwiwA
         MXysFfjSH5JNnDCNBq1awuf+992hrMxpkrPe5TL0vlNVhLQ0o9mSxo7nBXVULEP4Yell
         0WbOGkgFp0a6gjTSRBdikcwd2M+65t5OkETnd1jTIfuW/hOMB4D6ACyOR2/mtC/pb8cN
         M2rAmVFCm3AR0aZNcGfQgLUKXZUebFd26ZGRm0rchcwdHD51eDJZQsQodl5VYDF+pPmF
         dY7A==
X-Gm-Message-State: APuU4Z+gjOvhp04iqCFDrgEhXdk8bycIO6XlegiDxycpHZnd2cP+h2pg
	PdEktjOofZfe40VodsTamLks/AxUvMGLmC3GZtKafcTC/g24ttWsvwDv2DUUwDnMzeTH+6BKGwZ
	Entj23XftGs8t6eZZhWQ+5rxE6FjLxs7e0bAo6B9vLfzYAyfue6Yi/bF/iKpbAYG5Yhc=
X-Gm-Gg: AZFdTZdHZ8FVe4TXYQLVJhK/uUAimctw204nx8t4htfHOSuEWy3AipgDxo32NevMu4a
	Y6Mmp03Vvz6HXNLSmlapw2A+qJLkCVBXW8MNOCLJkXAeUDy1Vi9umcPqjGbh9QaqVB8XoMgaVb/
	Vv22IUxWPyuj2Mw8V3w5JMuYGp+rtAJHMif5lk3ijeATdLp9BnnhJ9uDyFT+CJGhuUk1rNvIqAm
	zY96jkLkRzoAh2vb7s35mmZ7KelvQIruWG4bz4EUfS+VZNER6Jw0RZXsJZKi76N0KbSgqC0XlkW
	VNeQMFjWKQFsiQVbxmtgAk3VVA9kZALoZAYfgoDHuE9IiDtHvrmJSlnpCux6oCYjhMaz3oPDiHO
	YfR1eaUqyMiJpMKlcsVm6MyGfF8hUuNiHl+TxfrF9HPmbedRMbwiLAOxwi7uhUD1t8J7/FCIVsI
	KCpep7SY1acPZXFsAL4Vsf66XfFWoB
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr17189726eec.2.1795563331632;
        Tue, 24 Nov 2026 15:35:31 -0800 (PST)
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr17189686eec.2.1795563331043;
        Tue, 24 Nov 2026 15:35:31 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm50037336eec.28.2026.11.24.15.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:35:30 -0800 (PST)
Date: Tue, 24 Nov 2026 15:35:24 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 04/34] firmware: arm_scmi: Add centralized detection
 of truncated replies
Message-ID: <20261124153524.000049d3@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-5-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-5-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b061f44 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=jPhv6GyDbwQFenseDfIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXz38Vd7WpNccU
 XA9+C+7g6uBIUXZU9Tk7UlZ2Q9MEjIQ6EwI++GkQtT1M7Rm6rGzEJJ1kdvNL0lNSVUbjAF3M8Dn
 DLWzcr2+tuoslvUs015vyGoZ4tgsmZD3qtFpbRD+I/B/ljLM4OmoCVz4fsrU4IqT6IF5PmIjo84
 NW99WA2kFumbOb59KUW4mVw/GB/qPx/+Vyw67fu6fpR5z3KCAj9nn/USZ3epcDdhJt28xuMPGi7
 /3JxhvYGwaapUAt7eHHj1tgdmppu6Ih9wZCd9iF9bNulz+PJe7IfKySUhHn4viWY9/wu2kkXzIt
 U4HKxbDuf75Q2p//NTx5EYvTcVSys2cWDiPPcilpgs9C2BISrsy0MeJXJADBjwKvpXq6s3+OHus
 ywejGRebflxv7y3IeqL/Cp0QBl5QdYAPkuphFaIuKatug21j1+5OeS7lmjyf71JVnm7PCCWosMS
 QZnxyZI6J+NYu7pdxcg==
X-Proofpoint-GUID: 0Tb9nFhvULGZ76J7gbntKaxYT5baVye3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX2asi+5MKeCei
 W/8W64qQNYL3NHGRrdhW/5Wht4s48sbxj50esRTH6CapUGr9iY+pbwLNc7JPlE8Sc+3luN9YBUH
 ykv0LHUIO0ldLS7Vw3wuaG5O7Xja+3c=
X-Proofpoint-ORIG-GUID: 0Tb9nFhvULGZ76J7gbntKaxYT5baVye3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When an xfer is allocated with a very well known fixed reply size by
> providing a non-zero rx_size parameter to xfer_get_init(), it becomes
> possible to verify if the effectively received reply was truncated.
> 
> Add the logic to detect and report truncated replies.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
A suggestion to perhaps move this to a different layer.

I don't feel that strongly about it though, so whilst that is my preference
this is fine if not.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
> v16 --> v17
>  - use %zu
>  - consider expected_size when reset_rx_to_max
> ---
>  drivers/firmware/arm_scmi/driver.c    | 14 +++++++++++++-
>  drivers/firmware/arm_scmi/protocols.h |  8 ++++++++
>  drivers/firmware/arm_scmi/raw_mode.c  |  1 +
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 6dd249c08f5f..35adee6a7a15 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1356,6 +1356,16 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
>  		}
>  	}
>  
> +	/* Check for truncated messages..it will be logged by the caller */
> +	if (!ret && !xfer->hdr.status && xfer->expected_rx_len &&
> +	    xfer->expected_rx_len != xfer->rx.len) {
> +		dev_dbg(dev,
> +			"Truncated reply - HDR:%08X  expected:%zu  received:%zu\n",
> +			pack_scmi_header(&xfer->hdr), xfer->expected_rx_len,
> +			xfer->rx.len);
> +		xfer->hdr.status = SCMI_ERR_COMMS;
> +	}

The check is good but it's the only validation done in this function and
the naming doesn't suggest any validation would be done in here.

There are only two call chains to this, so maybe it makes more sense
to move it up to do_xfer() / scmi_xfer_raw_worker()?
Small amount of duplication but in a place I think feels a little more natural.


> +
>  	return ret;
>  }
>  
> @@ -1508,7 +1518,7 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
>  	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
>  	struct scmi_info *info = handle_to_scmi_info(pi->handle);
>  
> -	xfer->rx.len = info->desc->max_msg_size;
> +	xfer->rx.len = xfer->expected_rx_len ?: info->desc->max_msg_size;
>  }
>  
>  /**
> @@ -1616,6 +1626,8 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
>  
>  	xfer->tx.len = tx_size;
>  	xfer->rx.len = rx_size ? : info->desc->max_msg_size;
> +	/* When a specific rx_size was specified, check for truncation */
> +	xfer->expected_rx_len = rx_size ? : 0;
>  	xfer->hdr.type = MSG_TYPE_COMMAND;
>  	xfer->hdr.id = msg_id;
>  	xfer->hdr.poll_completion = false;
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index c15ec188291a..50b89c56e309 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -106,6 +106,13 @@ struct scmi_msg_hdr {
>   * @rx: Receive message, the buffer should be pre-allocated to store
>   *	message. If request-ACK protocol is used, we can reuse the same
>   *	buffer for the rx path as we use for the tx path.
> + * @expected_rx_len: The expected length of the payload in the reply, excluding
> + *		     the status field. When set to a non-zero value this is used
> + *		     to evaluate if a reply had been possibly truncated due to a
> + *		     misconfigured transport: it is only set to some meaningful
> + *		     non-zero value for replies having a very well known fixed
> + *		     size, definitely not for variable-sized xfers with an RX
> + *		     len initialized to max_msg_size.
>   * @done: command message transmit completion event
>   * @async_done: pointer to delayed response message received event completion,
>   *		or NULL when no delayed response is expected. Protected by
> @@ -139,6 +146,7 @@ struct scmi_xfer {
>  	struct scmi_msg_hdr hdr;
>  	struct scmi_msg tx;
>  	struct scmi_msg rx;
> +	size_t expected_rx_len;
>  	struct completion done;
>  	struct completion *async_done;
>  	bool pending;
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
> index 7e42dd6cc2af..45206edff446 100644
> --- a/drivers/firmware/arm_scmi/raw_mode.c
> +++ b/drivers/firmware/arm_scmi/raw_mode.c
> @@ -574,6 +574,7 @@ static int scmi_xfer_raw_get_init(struct scmi_raw_mode_info *raw, void *buf,
>  	xfer->hdr.status = SCMI_SUCCESS;
>  	xfer->tx.len = tx_size;
>  	xfer->rx.len = raw->desc->max_msg_size;
> +	xfer->expected_rx_len = 0;
>  	/* Clear the whole TX buffer */
>  	memset(xfer->tx.buf, 0x00, raw->desc->max_msg_size);
>  	if (xfer->tx.len)

