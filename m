Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413702;
	b=LhE66LgyJAsZrL5PFkO5MuS0uwy1XdYhLynOYg80RnBDWaTqbuJI6w/D1sfNovOJCMgg
	 6w8nhLHPypdHs22BMDs+XDpiT/0jwptuTCyyuA6Pdj9LFxQjPluVg7W2pPZutWlO+/ZuQ
	 6EBbS40a/JV2CfiRVOQPWjP1gViHPJ8flV8KX3lhUwrT7/X95JaqcGrZdJhNDYrBx70s3
	 oCf4y0x6JI+V5qN2HxhFoOoamI45CZcmnqYqQxDIDoLCqkVbeBllhD8oi0rGVS0O/XlM4
	 W2oubaTUSETo4g0I0LqEDy0w2Y0k8a74+DOnSY5WGUhjBseXtzZdIG00sLPK+d+rQVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
	b=cPbWJaR6VFIaQFCLwkXG0n/YEzVeT1OQbZcWAJdV7tvmQh1kqCjCP+MhU5Z4kFf1lICi
	 k9L6LG10wG++2VneCIdpx5XLhCc4OJm9qDNOzxheUhg9KJMcvbbdmyr9VUFHC1nfjJMm5
	 DBFjlPZAN3O8gJiCGxzxIjeZtgiMAJZ61xgrAn87lP7MJlAh/JZPF8bfqg9ldBW+GjpWZ
	 nwWCR0GNbdJXGreaZ+1nRGi/rWtowJ8NL7refq0pwP+EesgWOfRNdWbESajjG3ijBmhc7
	 VkKYAT+LSQ6+HqAqZcXsViLFeOgigcvyTsbknd2YcMQFe8tjoxJryyo0ErgmlME8Thw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtzaIw8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/n8jnEX";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC86606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC86606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtzaIw8r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/n8jnEX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN519tw864622
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=; b=EtzaIw8rGcQzh2Dj
	wnTXDofEbfY32bwsYU96JGYvM3ZpOj2EVzHDzsqeBtXyPHsUHcxXAlTvYvLqXkbu
	W/mp+iw9BoNrf6drGbyHMhWHbpZQ7Xrl9EEkoqUkYAycUfY5cZ+jGCpdBF5HXIGj
	WoelSNpdAKjQjAs5jFec+L+duXBRuywvbcyp+PEHc6MV2vsQLf4cPlbfiKWnmaNk
	cNxezMT0xV+T+ffNOfCa9jepjzs9d6o0MfonmPFhnsBxH9B2o09ZiLa9o9XwCY4p
	KbN0un33j4nTpOAf+DFpbXSMFdVww0vFtYo/OPrv6x0Jr1D3njMweBDVv0qwJcEw
	9y7ymQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7wbj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3642634a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413699; x=1796018499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
        b=U/n8jnEXyU8oW34XNpcZjjP1qGZM5Dv5vPouYXcRFjk8ZzyB8JMPRdgVuUJfqku9yW
         xmlLxOSCqeYK8tejFEA4AtcxgLd1tAPQ28K2Tb37FP4q43X5s9HjQxZg7Fy6eIKD30Gq
         RvrIT5IEFjH80A3J7pmVvEdj0keVgDf8VcRhz+0KqMja1rlKLetkl3Hv7/q89G6zR68R
         FGjQbzJlP0ahNAms2oMW1E0CUPv1XMr79sOaFNZ7MCdEzEPAOiD/QWosTYbFn2ENIEQX
         exg2SIQg76v0XioOXu7++PBX7WNXD4mgBh9e98whnei0F+hBbPIMiVCbwDMVBw8OjXJg
         VyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413699; x=1796018499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
        b=wi9mR9JhkIW/YtxPmZzLZ2opUExgcnLE43m25w9hmu/19XgaDangGE6oVDY4RkBL2C
         fjtmpf0chlKXQJDfEUz6bmDkOljiEWlkDHasXaiOc/2rS4bG4Gc+wLQuUvWbUjRJkXTY
         pjCp8cxB/5fS5McxYCRZ+eXcjgSodw5bNITd+YvlIhRd3CxfHS9z/e/nCyP4X4DZdgi9
         BX/VQ9Mnn/71it9vOylP0GXpI5dxY6qQYqHOEPadOMPq66YyGQdEIksTOj6/iwcw0V2I
         8h8NW7t7TYVlvQG4P+3X2zf+kopwPHKJ5u0PPxxdPlg1Lxwa9HQnXOTGfeppl0lBJWkB
         Bn0g==
X-Forwarded-Encrypted: i=1; AL+hErFa1fF/2SL+XFX4Sa8pexDOsPWFpmhDzTrZCZrt+tGX2CU3s/2d12d3QPNHDkX5by4DdUCm7v/KeIvsdgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OEs3Rp4L4JpxvVKHJik2mRsF923pHxUQUkcA4SxATxjaNc4ix
	pMGI/cWR66TXjE9gzz1tcLTqP2M4HfAvOp/ptCsRanl0xEa1rDplVDEdTQ2XpOGVzsYqI33OdAk
	PN4fYiHm0S3j4VxoN8p/lmMLas/7wlwABw8VOOG9ajYzOQ5LTWIbFdA+TyWfdPkqL4BE=
X-Gm-Gg: AZFdTZfNI67Awi6KHiyNJYqjhraFchn5nsBJtiKZ+msiBSTlWky7lQVj0LulSHCpFKY
	X0U72cO7yTBgwsOC+KEBbSrPrlImWPkUQ4cK1umPf9VL5bsqv+tJcNFlJEr9PsLhvdu9dxSb0vu
	XD2S0xIAbwLH50Wk689Ir7ph5BZSB/CjsLpcB6PZL27aeVPjWuA9hhrTNvMNVsklUwQcqx+LJpz
	0iSWIEOAHDSwLdwX/yKuClI7ZcPplgqcDtLbuHhUDbhXcgyRfdsiaTaEj6XvFRmfggJ+dnksAkp
	N/MFX4iXMv6Y4AGpX1Sut5trF9kqLXA1s5hrPNDyvfPLZ7myFJ3WpjfSNbF6LdjBmxGwUR16bZk
	MOfrBObe5sn55p+AEcEsl5vTch7Ob+9XgT7AsLH9fX+p/iSl1ausJ851lbGcP9TPzUdHXW1Pbjt
	l+
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr10028683a91.30.1795413699306;
        Sun, 22 Nov 2026 22:01:39 -0800 (PST)
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr10028663a91.30.1795413698817;
        Sun, 22 Nov 2026 22:01:38 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm19210477a91.15.2026.11.22.22.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:01:37 -0800 (PST)
Message-ID: <1e2a8c71-61ac-4582-971c-15beb44e8675@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:31:34 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable <stable@kernel.org>, Peter Chen <peter.chen@oss.qualcomm.com>
References: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03d6c4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=DCMSvNR7CDFSMyVHwa0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX+cyQSCulBkNy
 Ns4Qr9tdj0dzvFwJAEVrNX2tOiMo7ybSC+wDhGCLWcaEhcGYQgIjtetMEQ2AbIACmZ2F4U1AfXa
 8oNuAKxQemhLoUefoNXFwJD0rm4S0HU=
X-Proofpoint-GUID: JVLuiMlliT68v73g1Ezso2C7jSAmboxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX7e5UX7ESqiMH
 Yj+HCcRLtkLNgW2C69JKPZefjF4zbjm13eFGk7YqiHt7gwzsOXuDfXOF2aKrdRVbsoC2YngtBt2
 h/QbmdojyRyKA7POS8togbXcs1LKRjWFh43pEG6CvQm+HnosAKfhwK6tS0U/q2MdRhwKODrAaRX
 7iOwmuQgSyyOY5gfRK2XzFy34AzkPxFIw2jz8LVYkPoJ/LTsdj25F2dNVpn5A7qTEqRphFRu+d7
 TSjLLFVY8VAflfpzhd8sg+OTfpuDbOZlUEKf7IV4uA3UsWDaELB6matZhLa6O5puHmV/PgVIwYB
 HrZEDMwB2knDXjoI4vnhIRsgyUY97r55fLPko5K2X+HgkkTsDDaPpRT4AZO9+BEiv54xfWsDIGA
 cSjNptdXQY1YIULWe5aYr0kCji8VgHhMu48o5qqWwBSzikOKeXXr80b4UBes/fF7bFA3DZPKoet
 RBhi0EN1RcBCBSBjkcA==
X-Proofpoint-ORIG-GUID: JVLuiMlliT68v73g1Ezso2C7jSAmboxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023


On 11/6/2026 10:46 AM, Prashanth K wrote:
> Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
> system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
> xhci is initialised. Since the probe failed, hcd will be null, and the
> subsequent access results in a NULL pointer dereference
> 
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000058
> 
> Call trace:
>   dwc3_qcom_pm_suspend
>   dpm_run_callback
>   device_suspend
>   dpm_suspend
>   dpm_suspend_start
>   suspend_devices_and_enter
>   pm_suspend
> 
> Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
> before accessing it.
> 
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> Cc: stable <stable@kernel.org>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
> Resending with Cc stable tag and review tags.
> Sorry for the spam, Greg can you please review and pick this patch ?
Let me know if you need me to send v4 instead of RESEND.

Thanks in advance,
Prashanth K
