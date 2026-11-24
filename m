Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562439;
	b=ZADaLF1q2K8V748ZnzaiVHYhg1J/wjylwmQeSIlhY/kG/AJ1GwGDoNWg/KkxbdQQH+Ba
	 iByQOSKUHp6eQE34zbVVxAROpmNuWAwYR3+IReXnY2WYZyeS1fkWezQNzo6QFFbPAOSVi
	 O5TkVXquyMVU2UuEu2spVxpeEW7FoQZ5pk20bTfI3GENPHKxbpkEZL6vY6A1e8hJ/G47w
	 f8p+RA8s1lY38syKXzi01YjaGoXGviH/2GM4OptyRBuySGp4pVPPB2kwETYhDwjHVsKA/
	 FsrMEzrjDsU/IlmVFcMf9j6iAfiBgkZO73cxzzaJnygrM6xxMwZIWnp1KdwlAvmpNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
	b=jbgir38+1LGEvSQIH0q2DcBB1DCuMpt1PHRFy7LE8epoYcTNs6qrgaqi78pSIT4Ja/ZE
	 miG7MOSe7AnOXP+7RynsIYKZaYyltk4CrWBHThkauD2CdwJexyj0hacV3fr4mzNyQZxoY
	 Dnz/S6AD/l4Rmt7z5dMF3/rT+Fyj4Pfg4pG2NjIhfyXYcTv7Ce05ol7d3Ac1HAqcvmd9n
	 v5953nxyCkudsoWm8KQb3i3TlZoV0/PdsEsTtueuMJSjhRRec6NruT69D73yC0pWhendc
	 ymcuzNnOyHvZ/PLc0/Wzig4p1MOpfrrbJwTEhL2ybz+2mkPUzJl8ihJBAs70MpZ23dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNbkNY9Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLxVR8fu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A527D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNbkNY9Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLxVR8fu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMabjB2139893
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=; b=iNbkNY9Q/L04JZ4G
	qETJC5rbd2pOWstVW0EwhXf5Ov0ejz4I4599gNgWU6w8oujtEEyhnQNYGp9qg95L
	dKgb2950z6WGts8R20qztvZ2B8Yvh9stSS2vuMx8mFmxCJwAOdVmrVz/WA+I7PgS
	fFhuyV54KA86XN+tSTVqexwp39o9V4FXtg3G8gNbZso1sepp7RCHPiDg7Z166KMQ
	OvbgNXxE6b6/5RAcz1eOeOKunNoexRixz5JXnStp1rYjcvclYN47h3pficNheSo0
	cCmQLYB/wrq0lvxhi+ctEUt6fN46bQ2oVrZFa386e0YZiIf4L7Fu1d1pn0+XE2NL
	a4S5qg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8ru4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:20:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b511ad8a2eso1330857c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562437; x=1796167237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=VLxVR8fuqbOfiMdFrEJfyk1GAaDT2nFPRenygO8Zx8z5a5ioX4yrSuaJAhyJECOZ3Z
         PipYTCKp+aYCosb9GGM7tyLQ/jQ1UAKbtZUhp7X1tC0ZHhbPb2SBAkxpEgg6odSsQzNz
         nQrUPYHDbvn5BLvwTX9YeAptmGO779fEzkHGrp/ZMEDC+rgEVwUKiPIEbV9+SHEtvVUM
         zd+NvL+C5BTqtOhVAk/DXnH9qMbSUvTqJslvgRQn9JFq/aMi9Q70kbvvum4lqU4+Ux7e
         bZXZ0Udgp1NT0/kpz+AkWCPB0lXSwvXO8m7Ner+7irlEFVj8Xwqe1XQRQw1DLD26K1Ja
         QrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562437; x=1796167237;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=zstgxDotFzy6ESWeWanDsT0Cvlb6NOuMFG7ZPPDLfzg0+1+uODYUE5N8+S9OCssRLc
         APgJ5qv66tOGBZrJnrocPlgB6jum4YNKJ11louMCY/8Pzr86iN/jE89kC5Y/srGaClIc
         FO2hE6PnXoQYsAtOfImhca85s85uCsyCjDdBgvnA3Aany5VazXYJ+ADWO5xllZq/d2M/
         qUgQ0Tb8L8zqPoJhyIsB1gGWOqsE0PTmlg+KhzPh3QxCd6gzMFhaWVrOgi+C2D06os6m
         EfTy/QWkhTnGXILEGf5fcYDelMElXbqVjoYmfAgAO70A6hSQBoAUqwOlpclvFTQKThZh
         FeAQ==
X-Gm-Message-State: APuU4Z/8LkemZ/cP9IQDSN6vexC8c8c3L8yWmgKz2QzLybE5QSPRuWpK
	dySDg9s0XBStF/us9Ku+s7+gRr63oxcKEAIYfuZqtX+2oxS2MAfe41cFz6gawx28GarxOu4FU51
	Qvw2Y+a63sQJUSXx8Njg0Xn8VFItjKwDLXzJ+wTp1nN/NRMK0HeFsLNU/8JJvkN4PeqY=
X-Gm-Gg: AZFdTZeljOxyzeVAdvfUP2xjrRntfwT/8K3gTpMNDfnN9Xi2cLCfRnC8pyiPhqpnk6l
	U5/Lue6g4ilKmBGgOq5U3yuOUkkv0XpLkfCRv7bYlWuT/ZGdtN3So//ou+GjCKXdeHBzum4QTCP
	LSYRDHCuT4Rks1S64JV/M5JrxqAReKoaqOe4z4evj4qMKua/1Uc29KjhquUY320vdJaoXOLC6yM
	EeULmzGi2/Aajz4XzJyheZIXq3pHVgOHFmj/75EQziRCbGtzk6/JOTrQGK0EGX+Ecy0Jg7+B6cO
	tOxBvSZ0s3eh60EFveXz6GyCDT2VRwaPq/8ofMLL0Gq6p/yGISG4tQY84VQuWSc2Psg2lVtWDtW
	SM98soYv7B3+w8UWLGH1Z0+SkOMpouVn8fKOmcyn0D1Mc1ag0JQ8aqHo0GvKnn6x4vqt0RxfUkp
	BMk+hxKQyx2xOXXJNc8/gRyuRKaSbp
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548246c88.12.1795562436780;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548210c88.12.1795562436093;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55096295c88.14.2026.11.24.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:20:35 -0800 (PST)
Date: Tue, 24 Nov 2026 15:20:30 -0800
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
Subject: Re: [PATCH v17 03/34] firmware: arm_scmi: Make Clock attributes
 size deterministic
Message-ID: <20261124152030.0000438d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-4-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-4-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: xSrA9qhzp3nyrIW7445hvAleqZO9znnu
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b061bc5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=jNwuLTo9DzxMKENvP54A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX5P7y463V2qc6
 MwpdgNZXk2rXx/abo/CX3aM61AIer57XqQok6L+0dTYA8Mu9QXKVUG/bCmE1uvAySgXtDPJl/lJ
 Uurp/8pk9egB2Mubv9r8dCmTDERfZnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX5EIp24Eq7iGA
 Q0A/pfiSSBwsXPRQ3jsmC3Gbe7kfoy+xFG5QNK8sAjjAYQK3VTzpqYVEajbSdv++PUjuAuOJKAE
 /td0uBx7p7/lGEgInb5nuL5JT125MENBGHPqmfMVLFIAkn5+fdx2THlgko2NrgB5WCNLszkvMbi
 iUSTgRsdDC7DSBnY4ktAfw07cq5fK+iJtclAfS7cDM9tY4Phtw/smQlUQo4w+A4K0X+GjbXnq7B
 oieRTwsYE5U3z0ErNOejoVFYlGmXk62bSnLlwvgym9HLglyzwLCE+/jthAFtVVlTg19fVubAovf
 GDKWzYLXz0A4RVnZLpP2AKFPkjkG9gWjjjiDJWPgTXQiAGjzSjmv422lCCkt1qXPFJm1fCJ7e9M
 NfsAxAKLEl0TmLCKukcprNUCAiWC7pojA3DihqQm8h2XpIpyiOLNkWQoJygzOMkb7IYXIe0bcH5
 lJhF5WttgL7+twf2ETg==
X-Proofpoint-ORIG-GUID: xSrA9qhzp3nyrIW7445hvAleqZO9znnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240092

On Tue, 24 Nov 2026 19:48:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Clock protocol CLOCK_ATTRIBUTES command varied in its reply payload
> size together with the specification evolution.
> 
> Between Clock version 0x10000 and 0x20000 one trailing field was added.
> The current implementation used the maximum possible payload size across
> any protocol version as the rx_size paramenter passed to xfer_get_init:
> such solution works fine but inhibits any possible centralized check on
> the size of the received reply.
> 
> Size the requested reply strictly according to the expected protocol
> version.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

You could use offsetof() so it doesn't matter if yet more fields
turn up later. In practice though you'll then have 3 options so this
code will change anyway, so meh. This is fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Being lazy I didn't check old specs :)



> ---
>  drivers/firmware/arm_scmi/clock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index 6b5d50b35a48..ed93970c3b87 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -362,10 +362,14 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>  	u32 attributes;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *attr;
> +	size_t rx_size = sizeof(*attr);
>  	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(attr->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*attr), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  
> @@ -1002,12 +1006,16 @@ scmi_clock_config_get(const struct scmi_protocol_handle *ph, u32 clk_id,
>  	int ret;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *resp;
> +	size_t rx_size = sizeof(*resp);
>  
>  	if (!enabled)
>  		return -EINVAL;
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(resp->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*resp), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  

