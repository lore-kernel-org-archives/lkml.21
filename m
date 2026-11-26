Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686894;
	b=y1xsSINhGg4aO3fvAEVyoWh+jRjhOD86mf7ZzuvNd2Z1tgE+EJaTOPtO/uS3NbbxKs5u
	 pxoBqhjg99B6vVKSHJ+i/d/i7cwyt5vxGfBImv1Z2NVU99rjsOn0cWdg2uwHgUu7VwxPq
	 9sfoIHpeCZ7VnrM+ubhV77pM6DiasoyJ/UAS1z26m0MriuUhaBk9k4xqMzh1I+jlQTRif
	 95c9HZTtLQzzUQRA5a1/O9Z7fHqpIkaZ/qM/ne7KX+horO0d6X0upxFnmTt/5tv11XONg
	 oVvtTOEfzNjFrNgp4OJRKy3hUbJasHPukGWFR6H3GdLAfkdZp4ENTPX7MU0xWTOxkGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
	b=K7B5ZqF6oG6xsDSZB5dgoBenarDZT2V1SmyhpND/ERkxbBKbr0YuXAgthszvmWfpwoBV
	 CwbxnDNO78FZN2a4zVMp9d9D1dCPNRjM1Fk5EtNxbSHXjvWV0C/YccQh9L9M0wsVEw0+D
	 ryGJnlpZH5tEUG4cnZaLZsmptGANlhtk4+A/ljpavtxEBiLNgVPVBilj1N4Likq5sk4IF
	 KPOZt0Y/1OP3Vg5eaG34bttgxg7i0GZAuiR13WmfFaQst0fxA4nYefaDDmlnCsZRKu4BU
	 XHFlC9IlkoMNaEUKAi26IvpnxMQz3pvv63fTPcgyoQB2z0nDLi8C4GygEqOQK9asvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9l23548468
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kdx3A01MCHfzKvhg6F0IDQCh
	+hcLdzZP3RW8GaIG51Y=; b=hQFc0EDiTPqXE7kwdzQTEPaHnmIXWz979peW16gD
	O0GOiYtjeORCvlpsScpsJkTWRMOJqQWkutpOfsfzli45j6SaydbSQJf9bmxaHBMX
	w6SCkc0Ty9t68lnVBbx27juVGfv4V6xMYGUzVKo5PC8WgFoCAhVTEMCmlK57Jmxj
	b/IR6tF3fto7WruC9oZmpwbU2u/2BLHA7uo11udqhO0YjKRX+5lW2Q9RIRUrT+gk
	4YLaFj6oNh6M5yaCd3HokghKd2UdFt5xjZCtxlCG10RhusyUXsr55VCc8vx4GlkY
	u2Bj8tzOj17i3WWbIOJHfe57ZDitnXRVqiDd1l5iG5Jn2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaucx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so6182834c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686892; x=1796291692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=JeAEFP6ylE8rXHTIvD0QRiEWN67zOk9bEHakf6vMrijmjLKWT3wQ+yn1fIiWPlNEqo
         mYhqIixu0MXzvg7wXpstgXLXUPLwKbBzKxU7DcNRinV9esLb2wMLnLpK8okOI35h4WKr
         AhuLO9IukBfzkAyFuipW1cJl36pSfuGfQJrgWB+n3K26Jmeovq9DB2JiU0qNcti7E/MG
         u3wqsQfGbKQMN7b1WR7eCBK2YHm8kRBIyYxT82dEhBUR3CgcrO4j2aV/nl9Ey2tuV5MS
         P8XBfNO15alpxa4cxHIhIVRIOMQDBDsRLmXO3COI6Cowz9M5Q/VA4s1OGvxMMtsBLXGk
         iG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686892; x=1796291692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=l/c2pVWlsAUfcYRbfrQCpHzaW2cgSt3AIOZbzdOyTN+cIBhYMR7eCqWyAu62kujmpl
         Wol1RyuHSiqSOw5vYTGHoi9IMRv7eu/MUR6bxQrwaqnqUF5KrQEfcJLubBDBCB2oqkWY
         cyxIjK95nHhVqpV+CU5XY5BY+zgmEOb52PWKAnX+4+5cZX4aX0hvn3Ihhvbe69sED5tZ
         uiFcbUVWS1nsr4wgTbWhhj3p8c8D9jamlBf4nuJfcs22qU+f2W1ixh1f0dCjvpKUdBUT
         wKsm/7hgcmavzuurl6LZPw1fDmce+wrO1X9tIb2zyEaBVAy6ndatItquPwg2cdOpgnWp
         6Mxw==
X-Forwarded-Encrypted: i=1; AL+hErGRcpZiBI7ELpuiintjX08eyJDVzVBvDDRyN4RJm6GtOu1DvU/dq556kNZ1P6fwswkn2C2YaconH2jHarE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i6Vpuq+DPZuwU+refI8jaUCG9pGd3LGBxL1+dvJPrM1mCjg2B
	il0GsHM7Mezy//y5VoFijpyJ9S7+o7m1IpGhQbdvcijm1YPTQwUiLSQXHy3pO0DQe6lfHH+HKQL
	V5QSGLHAWsx+cW4OlpKSy0u9A7jKBkNooGLYRcCB13BY/A1N7KJeru5wiHtLle1RzQFQ=
X-Gm-Gg: AZFdTZfvamrTJScyaG2Q8MAUpKrEWa4UwKXXsEHOpjR5/8pkCuobexvUbuLuHwbN/RT
	NJlLZ5KvDyXsVJ/QtbyW5Xkyp0lgXXLtra6s7sY5YdtwPI+Gh1sdprisPAEcp4afjpztG01cEZK
	e6zcSJPrRiwx4Yr0gpP/eY0K68lRvE7vsQbUxaqF9l+Ws0QVJqr9cjiXjVj5lp7MbWrsrO0Suag
	chJaMCJnUQJVTE1ktpIJzP1f/xMIUY0uHKh+a8QXR0Wiglo530bjIfgu1vNVgrhpMUaH45DuH2d
	bHb2o0tLJhSw64aE0CZIo+AdXk1qK4ZqOEYmT3Cy9VHYpBLj2y3nCwezVrcd5Wgyd5LF71Gky4P
	JQWZ7pGg5dUp4wjijNIIfa9alcz41o3+Tup8FTQW/ueEjsxQQWT1XaAhTQhOeAp8OJEzuKDKFcY
	3pxbzWnQpINhSdK9N7sQ5BJGk=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577026c88.15.1795686891981;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577003c88.15.1795686891362;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48932950c88.10.2026.11.26.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Date: Thu, 26 Nov 2026 01:54:49 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
Message-ID: <awgB6a2rwB1auFpQ@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+rAZnP3UYFEG
 waVob2HhL58yjLp0K2bRWSB1Y5cjkuNRdmH3CIAdhsXa25C/18PLnV8ZdZJ3xN42iV5YVHFJzmp
 3e0NI+UZGtKy9/zBA30XnDnzG+66xWI=
X-Proofpoint-ORIG-GUID: Kl8tv8KlxbG8kM3KmAlK-M0qtcbOEbz5
X-Proofpoint-GUID: Kl8tv8KlxbG8kM3KmAlK-M0qtcbOEbz5
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0801ec cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2q1QCJqqa6WVGGjbUB4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9sTdKoqpil6p
 GAjUfRQrYOh71Q1iQn+31HrGP7gufWYNvMvsGz8vYF+WJaUqhu4DGIoUewxxMZFzstwUdkW6XCe
 muuuLjGvythX4JMv1AuEMp08lJfl6c8hXs8Krm7CxObnyzNrvfFPpU5hZ9k3GnSx5BDLKg11m/a
 nWYK4qNLoIdxZYqdRDg+5V2j3ZyGRUhuak4JRbzs4J9w5Y7UnjyHzALj44dsEyJIBx//A88Ij9x
 g5sLHUE7JTrIxZiQ5wByKMcvgZNKzHnzWAfOhOBtiFdlNalrCxKuaIqU57cpnvuEmJ1Amy2Dqlh
 OacKKhZybrbWZAjxBDCHS+dGQ+454Sjp6RiqVVRd11o7yIZGUQRSy7+o1l+wmkry3Q8xH23ZFvF
 dg7aFh25FiZxNwpNA8fRKVbG7vr83TUuKzIB5nrLUkR/nz79Q8ON43hqmToMUABW/W+QUn6DhaY
 xBbiGwcFY1hFlmiE8jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:23, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>  	}
>  
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->is_suspended = false;
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
