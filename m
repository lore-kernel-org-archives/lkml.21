Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560624;
	b=g3AkRiph65D++3C+V3ZkAkJfiMobjUCoiOrJgHaD7Y36bWPAfNDf1G939bM5tOZk8QXo
	 gMpRaJavesMYqq3DljBKJ5us+ctM73COxHzoJaNRBpWYWPXVLmYuyKZJRvs4A9LWBm1xN
	 4tcE2s/NFiRMtkNKPrbog7UOtQ6Vlfdmkm6a8EAsEBSiUwlaPHkA+4GEyiVXoTFnm6fpg
	 xgUsxMBqrR/1X1m1TchrSosZwL5rwj/7pTqK97MfGF1+r/NJRQwq+x+xyxvNBeDnwDWZn
	 ty1lQkXgfTv1bRCa/njR9DReFaeKYBkLCqN0BQC672J5WO4v4M0k+VC5JmMa86OHQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
	b=ZXp4Me4xw5NM6ZHPaMh9T2IjVWs6+DhIlihlehi8PPCoosyOQ7URhQ8ODxISUoGRwnmY
	 81Pdn9iA4SzegIuY3RhPlAXO8DGrpfxirSpCOkUkgEiV14YkdhZRsr7jts7LVN9uVahch
	 PsIidu9fszi77C7wwboGYutL0LiFcI7cxMf86sl2CvxjNxdY2MCrxIxXU+3JXKSr9AVNv
	 DZA2i7Bh3odPqw+H3HaeUMxvgrybRsHgNtAHK6/70hBRn5DNNYIpAqLN+ORSZnq6LKTbi
	 sIZrux65VitImSSwzy8vtU4rFR/bP5XSWTPmi31mbemHTAvE/0JCPHbAxibmB077H2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TzX/Y9Tk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XupDSKsX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E68606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E68606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TzX/Y9Tk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XupDSKsX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMadCQ2139911
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=; b=TzX/Y9TkWw/uOJkZ
	b1ybUzAde1TA/HmSrnOU6olDuykfTgNFMJiO7/qL4o016GK1BGTw/IU0ltsNc65R
	DgTHZyAlgwgi3MtQJWTNwP4KpoNDnM453LIEqGEhBPRJHz3LPqAm8kqinHd8zoF5
	v/TSAMmlGr/KeJ1RkfFKiVp/UCNGR6z1xmNZ9EPEdhjmuXFy5y7Sg/28Zssldfse
	t13corOqh/ulmWOjQw74JeCk54fByFIpIksno+MoppOs3FORAm7jMFy5TT5W15FO
	LKj/4wvo6kgSPTem/8JUElunF26eVv60y4WGdW2lE5HZhxfLc3eYdkyf/jaXKpS3
	PqW6VA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8pb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:50:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5575027eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560622; x=1796165422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=XupDSKsXkN+qJBwREIeVSgDFOU9/TkqbB+jSi6xg9joh8lmSJ5vV/a8Z8AKRjRlYUu
         F2trWmI1LvlsSBLCy3clQkX25mitmdcyEm6XmbTHWfj1Qx7p1rHe0qsiHPIKKDdgfRRA
         HS+vdKn7o70eyBl1h6cXGaj/4jery51dQrU3pemHYb01Guvyn/D0jbEp2TCW06JaAP1l
         GjeCNn0GY67Dc67vO8iKD9bFxZvAGIUB1CPeJ4mLdbfB415gn6+aHx19c5r5FuRZzFgU
         HZx2VkDEI4wJB8Go6PYvOMxlhsPArd3hnyMkXHbZ2qOaObRDxRYrLPSITK1Y/7sS0uCo
         JQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560622; x=1796165422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=oA6tUzjveJeeCwlppzeRzNmfJ8c1u/12o0ki9i/HJ1q6py2MgUmg0IrYVtVI02WYjA
         aiIt7AG8daScArdboiE9/vdvem2qcpMyU3YQLEaAHKLEBHHD4VZAKh7U355jnxZ5om5/
         Y8xnvt+7amKeh0mrGdESu2hAowrU56BSqNeb0Q3DnYG3pZRQUDUqkq5uxIQhSjlQs0M5
         zuEAYGIS0ChB9ibshrX83kR7wzm4La4uXWB6Euux9GEu2oOqMVDx7S2ItPDKkJq6EF+a
         GpVKlrjt5C0DCdutkTZs0GRoCvi6EH8yekQullsYas5JMSrhcbCFdikIK19HhaVYGdUP
         CxIw==
X-Gm-Message-State: APuU4Z+coPsfAxXAvksldyiKXBWiKVymr+zWiw6vhtzWpbkEu+w10F6s
	ywT6ugfr7FV4JWf6NBvSNLSFhUASHzOBY3QhXxFnxa3idkeTI+naT7BNpxtYwCJ35fsJuwoNt02
	jeWpXGo/mBq11zNc1gfQpAz+zQd4d9mTHrjRK8rAM+X4Hxe117tMWV+JVFxLA8guR2mQ=
X-Gm-Gg: AZFdTZfdUriMRpFwF5/3u3oh4xMWk7A+prhRL7Y8kOS/HjYdNFYy2aFW6F4hIlkO4wc
	hFUqsewKu3yTrITdCnkCBE+igIKKkLbbMrlCeiRVeH9hgkYr0LYGElR7Dl2WMIg6vflIMByLagu
	fcg9J21CozoZYgh9H8JYkHDqt69L2LMIHzw3zqme7grzihTIdsTSAaVcFcU5PDvij+wVoU1Z2h6
	nD4MKyPvqXpcNLUoLrgZbq039dLSIQDB0f7iNBc8KFWzgwAcM5Simpw+EMEBa//RdfWXkNncWPb
	nCUa2O1KT83zfJyTJemLYZFzlFdWdyHramWxCA048flJvlNbWGslyEjNZU5Ib8q4wPd6qcKbk+7
	TRz+wmruQz+hC5eJosIc5DxeOvCQCkJidQLFldGh3P+zRrcBskE4qbBKa1f1QXR7lGz8wGvVYp9
	rPLXw52ZguU/YSKExmDgeZynxejUQ=
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462723eec.0.1795560621895;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462702eec.0.1795560621322;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57035445eec.10.2026.11.24.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Date: Tue, 24 Nov 2026 14:50:15 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Message-ID: <20261124145015.0000358e@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-3-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-3-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: nMBPEv17Ljoo0QybnlsPBk0G9lqYI86E
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b0614ae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=dr6W7SPZJ_YoKJA_jgUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX+Pfy+B4CqkCX
 jhTakXxzZ3TVvgPEch3cxBOrajcZy2pMqUxCYd182ulHGrMc8j29WjURJAsDG3LVg36oz3gm5Dq
 CbFAiZ+y6wLTzNdLRfNLOlt9XMJU3mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX0yuNFBJ2Nw4q
 y2Mx2OEafjOv/aFEiDs19FvB+e3ST7f/tvrwvQW6hM2LBjbov/v2B13dCfxUbulOIZ97DYdAv08
 Spjlq9Q0GgK+8nF8GLZJ+uOqrj2JD/6/anoGsPU1y3Mz2l/DzavXl6ENeu9DoHaAsUo2gGSqfa4
 dJwbcKpWP8t4eHNb7p1faL5faxg6tUxNUZlsqAp+evb5PkIgD6fkZhheWBBYCsdL4lgAs9QNfDP
 t4tALe/o3dfztwtO9n5PuwXhUNgbft0/IIwdWbXjXFnLqnicIGeFW4RDKcnsSL3ZusLsgcri5DG
 5aAZcosC+7mS7SEYzFRAi3kVk4Syyac4QtPY04i/4wLJbHixtS7FXo2igLTC8IeSKQNurnX4j+B
 pzIJ+5/wV94RunzmXSSJrxWPOfNtLbKc70y/VwPFbmZXyvewFmACMyBn0+OfHRV0v+N3vsGuQmA
 l2+iedUHf8JeZAqkszg==
X-Proofpoint-ORIG-GUID: nMBPEv17Ljoo0QybnlsPBk0G9lqYI86E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240089

On Tue, 24 Nov 2026 18:51:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Simplify protocol initialization and finalization using cleanup handlers.
> Relocate the protocol put operations out of the setup and cleanup code so
> as to be executed strictly after the protocol devres groups have been
> fully released.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Lol. I should have read on! Nice that you have found the time to look at this.

> ---
>  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
>  1 file changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 2c4424aa0d37..199f0a189432 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
>   *
>   * Context: Assumes to be called with @protocols_mtx already acquired.
>   * Return: A reference to a freshly allocated and initialized protocol instance
> - *	   or ERR_PTR on failure. On failure the @proto reference is at first
> - *	   put using @scmi_protocol_put() before releasing all the devres group.
> + *	   or ERR_PTR on failure.
>   */
>  static struct scmi_protocol_instance *
>  scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  				  const struct scmi_protocol *proto)
>  {
> +	const struct scmi_handle *handle = &info->handle;
> +	struct scmi_protocol_instance *pi;
>  	int ret = -ENOMEM;
>  	void *gid;
> -	struct scmi_protocol_instance *pi;
> -	const struct scmi_handle *handle = &info->handle;
>  
>  	/* Protocol specific devres group */
>  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
> -	if (!gid) {
> -		scmi_protocol_put(proto);
> -		goto out;
> -	}
> +	if (!gid)
> +		return ERR_PTR(ret);
>  
>  	pi = devm_kzalloc_obj(handle->dev, *pi);
>  	if (!pi)
> @@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	if (pi->proto->instance_deinit)
>  		pi->proto->instance_deinit(&pi->ph);
>  clean:
> -	/* Take care to put the protocol module's owner before releasing all */
> -	scmi_protocol_put(proto);
>  	devres_release_group(handle->dev, gid);
> -out:
>  	return ERR_PTR(ret);
>  }
Better though the devres group approach works best in my view when it's a wrapper
around a helper.

	gid = dev_res_open_group(handle->dev, NULL, GFP_KERNEL);
	pi = __scmi_alloc_init_protocol_instance();
	if (IS_ERR(pi)) {
		devres_release_group(handle->dev, gid);	
		return pi;
	}

	devres_close_group(handlde->dev, gid);
	return pi;

Though here you'd have more or less a wrapper surrounding a wrapper, so fine to
just push this up into scmi_alloc_init_protocol_instance()

Anyhow even if you leave like you have it this is a great improvement.
Lifetimes in these calls are now a little less complex to reason about.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
