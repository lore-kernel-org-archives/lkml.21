Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785980;
	b=Mpjyp2Ji8q6xo5eY+TN3WKot/cJ9S3hdw9Iu9qBM9Z9JUAIpKW+4n+hoifMYf3D3UW+G
	 jLIl8hNFSU4o/XgznysHvCDKx7rAI6GWmRp0FiGRLPCwEuj/jiY6eaw+o7U/NmtGWyugs
	 98APLl7dqcqSeBOYuEB2ZUjyKVnGqbfH3uxSnXOxfut0h1/R+HesZ/YJjeXpPyVNULsgR
	 LpKPVUcjRBFX2HK/cwfUgB4DrMX71ZEkVSyZ0FiP0yEKdoIm9YtrASQ4pg9Ys7ODxrTnS
	 5x8XTc9Y43A1LODupU7kIaAvaGZkqz71frEjAVnMwNQ71qqXsyZEclXEdk9WtjB1ihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
	b=3mI3W+4v2f9J6/FgQ9/dJF+N4S0wSL/xIKbRtqviL7VfKqnRMyF0MS43p3ssIMPbeyiT
	 4n8rcKARm2aaJ/fKemOZYkCz+MWB4VOEx6egsoDpPCAgWJ/VotW6S36vsMpmz0Zc9OwSl
	 YbvVHcW7ivosaVJPxPRHQ99JIu/qsW5q/DHkDV3dpmkluygcbPL6ZBB0t2xRoWAQeGPpx
	 QSGoNz52tvCL2xIiDKy1oTZ2nBNSfuWteLLhwvTQ8GPu2D4EawOpjcKG8MEfT5AnZCp8R
	 p6zp/z9iJOnCLR1KyPxcIUGjpAkkz3ohZSuyzgFzTke6LAmCs7zNAwen6l1TrO32Muw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fL/GMGNI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605DB606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fL/GMGNI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh6YK2301645
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=; b=gTala7n01tU2cB5+
	uWdw4rRZjX40s/buTh7RST/DQvNqQZxeIR7KLjvn9b51gNUHMAOJ+5qyMNQf7frF
	POCODruCSV5+xvJDW9IpznqFYKKOPrdGJ4+QOu5rqQejswufFT+jHnzWLMqxEKDh
	oF/7nAVfA7bNXsy11cplSq9kjqD+zLe/mJhGdP26o9RvzF+lVEP+/dQlyTwXqs2+
	B/3UmXCR8mJzpqmvJDZzyVKQhamVnP3auznLs6io1lkIhqYn4qAzhll2khaUorKf
	hqXYa6kN4FiqzL+pui5EV5kur0E+Y6htRxOkea0xaz5UHrK52TzrtI/G/eYkKuA0
	CMDU1g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasmkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92134a35ec9so7927376d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785978; x=1796390778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=fL/GMGNIXRzTak0MXqfvh1GykEEbv+J63o3Kf+vl3839bOE0G7z3HTHY24DHEdHSjS
         bAoCG0IMf6M3nkcUViMxSXCf1ucg3SeOmDomdNVcAdTZ5OahW1iP/reVjVV1JEnFtjIi
         UrYBqp8ZlRpIJhKWTXYsl/SyVXhzD5PAGVZXcVBolp/XEU5TAEoLB8Z4ZCtGtvSmA0jr
         6nHYv3J75Ua0TCaVu+t9I+TC2pNvpqjBAtsj5LS4wYXOWsPyskxgCBm/WvXicZsHMB5B
         rRCGz8CklkgG63APYMdzCMMQohlFhhUs0p9VhsrsYkgzSFgKMCIq173Q64HTt0EXEP4t
         piLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785978; x=1796390778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=s4ICdAZTZqo9q8cKtuehEo4gRb8QBhCU+VZJQ1YlRfxhBwMrbFdKgAhsuPKFNkPiu2
         RD2zAizqcr5B94MIGIKJnHInUXJXjqfeuRQ3+txNul9chOsQ0VYv/Ho0qxHXcDgP+gFP
         qDxnNEXexJzKcLusgqoVoqK3+YUdBeTiR27zdbiUOM32KVIPoe/dD0j8xd2NoMDvUan4
         s8HtszI9SmtKVSXOR25kMdIDPS7t6j0KqSRKdqw9CG0Rl0Z174IW6L+mlhBHEFNortlO
         28lro2lzg+Wu91axmuLaFItzdNIGqKD+f/LhpPlSB7adhVctCPqW88j0O/ny66BNRfFY
         nQLA==
X-Forwarded-Encrypted: i=1; AL+hErHuXVHDN8xaeXaU95UVYoTVHZlsBueUYDfmlNZlK5WQeKLBsMMTllrMazfD2GNCgiqSYETQOO2kzoxkB3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z94M+wMjkhESBWA99s65kPncwdCaFsh6+dIxKX153X4juHw3aId
	g5bzSuQC4AF0W5080ZoPKu9wQOf9fzXRH6o/PF5d9ziKF2meokHb5HiFK1HV4Qwkh8vmjtnNd2C
	9G+05Y8XeN7MVsiQIQOK8GwlaY5nM7BFZwc/5+Iq2XVPyKGTuNDtbcyguoXWlPH1/yN6LD21AWI
	8=
X-Gm-Gg: AZFdTZczSPViZh+8yTS8YoCZlqHdzOF5GawbPWtMEYnj4xmMM2XAPidOjSThMWC40Jw
	tZUzLB2gXAxVKuL+4nqqpqZavqvNJ5pzU8ipcEkD0vJndgzhdpDEwNdH02NBtXCbVwMQ5jhfhOo
	gYhQZrxR3kjCFng7WFj7dUZTPGB+92gfEpEmYjJjE9OGh1mykDuqTxhuNwYGQ/fbe+q4M1SW8LK
	lTDU4dLH3bGJ3Wr8n+rrooqpqrjJzLbxJMzggkSqb9KSOd+rwoXH0HIl2LQsbT+b7AE0gDj0uYw
	1nv2Umuy+SC42knybA4lM93kI47LhK8XgxMz1G+fAOh9tYDg40nznXbp3rVlJjDy5Lj42/aDNYU
	Uk/hiNETzMSsTRjl1wrKTBDh9Kd3kNq05hdFb05CR/MDnFeiO/+fGPnRY1/zshWD4518Owl8=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555766685a.5.1795785977671;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555760785a.5.1795785977172;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm856186866b.51.2026.11.27.05.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:26:16 -0800 (PST)
Message-ID: <1bd90d60-8f5c-492c-8d82-71a1de995a9b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:26:14 +0100
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
Subject: Re: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
 <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3I3yvaap-9z_NoH6ZVQNaff_58jLa9SY
X-Proofpoint-GUID: 3I3yvaap-9z_NoH6ZVQNaff_58jLa9SY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXxY/hfs251zEl
 WMynwOwHOyhukHOai0mQLmW9EGrfa4V8AuJh55el4OQysFqXlkSOIRAR+1qdWGum7J2V5syE7Y/
 k4TdsTTnnuNHQwWPijqmO3q5cxn5z5wIl8woxdv1fPO8qK24HG3k6aOH56qsb/v08fBhJtDON2k
 soW+nt0tlp/Qs9KD8s+VY/leOuABEofgu59WI/zY3i0JwpjrsgNvkA+6chx45vFnSrxNWInzP3t
 +g27pDmrOilSDxjAUdJHx5WNPvLEmUJAR6r8m0s95o0PtWyv+B/sHdkg9yD8u3iD8ap2ySRPqH1
 J5zCIe+GoH6+IE/R3dWbSTRuHwTxEhNIbbhJOuU8k/cTZ8J3hLNbY1G2j2CHfQthrwm+jFUALAh
 5BgcLXEBH8We6SxgIm/Nx5rYFYdlO2ipLAw4+JtIHGLDK1SXV0Vzp1bwAkzvBqDAWKPEbWdNEPR
 Vra+pVHRpAdk5iw59Ow==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0984fa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0_OSfFgOA50T1ex7QDYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXwoTqQkaId5ym
 kvZ3phnQ8acUWo9DPkgmcpeb6Ig3ebFdGugOKQzy/JdkKio/c1rqIv3lym7LDRhrSDJSUwarsiy
 w0vkxf4G6iWy6ORXDFv+X2Lnqj4jwws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053

On 11/27/26 12:41 PM, Bartosz Golaszewski wrote:
> Add the RPMh clocks present on the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
