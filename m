Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563991;
	b=kpAW7j+Pr9/JHX5E4IdTjmdcDaOCtFlcImton7FXLm5rl/tE6bNBBvfUh56W//6PZwhl
	 5Yum6hR/sXhfpVytG4KAUYKiWNnj1EUWBPyGr5kZ4ImDIamT8p+UvfIcZ9z46FYws+o9u
	 cOBvD1b8T+YiBu5oepk0LP5RVZM+yMJwrhiK4fj/tqz9n/St8QY2Q5uwhbOhSt9t0uy3r
	 lHvc0IAMQiPM2yAyNC8k4LN+5B04Js3P66sDWCDZ+c/+YGwmPyKKpVdx4NyDOi4Uxa+n1
	 5xqUoBE3aPeRsMi+raO9KJbCtCPNMDwZBOI15xDCWYltE9Ru7gzqYtbkzOUXyhDmQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
	b=4SJRgLeaPUoklUqm3anX3nVGQzWkP1A9NH7XosWv7pKA8W1YZe2WQIz1ESlx4MM8TRSf
	 uFVkMmsisdTSso62LtE3H2cdvnncs4uuyFxhzGD1g555mRWDfTy1j0uvHvlK9mw9KgkqB
	 iG8Y20TX9KqXmDU/MObuz9VCpzmTduEuMdqE6vgAZNC0b2pjPZLE8UAiSgj2bXCb88yG1
	 qpNRT2dndyrD8Ue0aK1f+Nv78Y9drOl0ATB6mXxu04x2yQJSa1cSaFjK1z+8tygX4ZQHk
	 jPQnh7wZ6U+jVtVdqbxKgOx2oMxuDQ1zG0H6Vx5r92iY3u3ameGes6p06WHjhm9HLkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F799606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F799606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMag0M3274109
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=CUa2qDGttwLbSHCe
	3/pC86Ngts4KXgnbkhsDq/KclOuhAVRzaTqbMXG/Vg+On3NjvZqF1nm5/iSTOcm+
	tpP1nId2DuTIHQU4UbYXU4F4YToDCFwCAiTfAxw4r3S8BWbq7x7gxJpMCzan36d/
	v3Nmwt9JgL01GAFGwrpi53seHnHUhefzuDFplx2m8PSUAhWWcjIswqyk1+Bsasti
	W/+b53ygej1z4kJetQ9I/1B77I7q2JnCJKo+uFqRtwzjR1HHlABiLkYkPAMS45J+
	8dRr/QwxDemzJRrsJpMpS6TOhglWR4ggdG2gHR95jFd5toa9OogBGhjQ/LZyG877
	N8z3HA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf8svv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so3944570eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563989; x=1796168789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=dMs8C6eqRPCtEBWcVED492Bexr9FYlS+abGyMDHGZoVtgWNStmm/juYzjc+0h5DBEj
         GHr1ozSZinhyv/jn8z23lnp9z5ExnZ8yG1fmE2ZC5c4NQtZchsfqGw5oYyX8OLCLWMhu
         ghxhguOShbUXMsdtzChNhJ2HGNensBOVYcCv0fw7fZeEiULXcVZwSyrp+OhKx3NIS0rS
         pZnI841DTJK0ptnA7JCM+yKq/FoyWkVkMCCBPLsU9jwxy99GTUmZz1SGR4wT9zTcUj1Y
         5wa+V/BJrVH8AOAEp9vJn/I/fowKmiIc+LL+me9krhALTcyWX9ss6eV7GFIhLEIUKREE
         5Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563989; x=1796168789;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=tQe5rAdAXl30NVgz8auO+8NeRrqhnawOx45YShP2nC/VNetECi9X9sMeILoumlYL2r
         3UjwGk5EoPI7nS91V3F9Y9pwfUzNLFF3tgrJAUNzGuuNhyZGF7EvoxuQfDdcoOOX50sX
         maK968lH/qQlpJrYH3VFa5sZ+Cv1bjAQ2cK1Nw46C78b6Zzuhrp+wUdaaHnzD04/At9k
         MpapRpZq/jWzVYvSh76HtkcScO3+34Mf3ebQdN2/5DwB/yhgkLVynr4wFJJxjdmYiJR0
         zSAs9tz913BKO4r4tuybr6gJf/fqoQncDCnJJ+1B5s3rECFS+r+fJa2MGuawEiBgnjOW
         je1A==
X-Gm-Message-State: APuU4Z+7sSFEdTqEEQDZtLNemUYcTeVX70S4tIparGyP67QL9qzxvDPg
	Jwj/8dJxiNU1y6agrrgfPciSnQio4FKILHThEqL/2BwLIJW8SmSYZRaWEJTTUw++LerH5wXSfBl
	ARdhYStn/8Pj12ePGLXwchkezr7Wqn3vbil2B7v1YMh8/IvqMcrLjA2UbaDlGJXng7Y4=
X-Gm-Gg: AZFdTZcyTrbyKbcT76FVOIEkDOV5fFrnPrbJ0LlQoTGpeD8p52OVWCasgR8lhG9ger4
	yaPZUpsHa7a1l+mjJyBohT4IVezbI6Ijt6X8x59CSTksG6tXI55SZBXJGVD6Ves3LqRS463DeO9
	/fDGpzkq1EKnXAw94yxUkl7Qoi77MYQGvzjZIP+VjAnk/DGnmSbLkgIJWUDdPceAAMKegiuPZ0+
	gBrmIIJTZO7ao2xR8G1r/TBf7cqLoqWKsyL17ALdZ79yp55yvEjGwPdwVk+raaFNpjH7k3otttz
	afdC+FSJUtI+Khysg9q+6RTS5FDF/dOCMhG7PsWP1131JDibJfyEvrN09YAweezjNeTJIvQiDRc
	va6M3RSMe/TGy5122qiV0NLWZXqqg2zwha/jeVDtB9N3Kbi/batWal4/Vc4KkbqbR7tGe/cu2UV
	AmnYaHZ2Tv/myFUPmuu+EGOIFHkPXK
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027370eec.29.1795563988979;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027324eec.29.1795563988410;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57314365eec.10.2026.11.24.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:46:23 -0800
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
        usama.arif@linux.dev, kernel-team@meta.com,
        "Rob
 Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20261124154623.00000587@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-10-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-10-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX3GN21NQDQhKI
 8eWtfSN/L5Wd4X9hrtqkAn84m3Fv7+HWYA6Mh9SxJJIU/E/WN6A5ZiP3v1gJ6pDZLHaZqmmZvM+
 3xZ/OdWP3INDu6hLwM5lar/XIzqg54E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX/jdJ1kyDk//i
 +n3vNQMRBa8kntbhwEtDbYj/kOmjzR57SP0DxMFbNewc6wJ5Pkp+5TSmtm5jRi5QlmCAQqlPXos
 kcU9nEt91FqpZtQslj0dck5/WyNIq7RASninYUEYIqrOKblz8pMUElGQv1j7fiz61tRYPt1m2rI
 DcpTSTgg6cXvWES21rDTbgXGFXSls2/LmlJJVwDEBgTzG5WaB6rlQjTsfLh4eMnyWKnqQvdU+t4
 J5MHB0DoDwfoQi0L+q4nkxovnd/PSmFKGCUtlyjj5Qtr122nVmsf77dfYaAUBQ5PCtDw+3bb7id
 tU10XLH+yhg5KbyLf//t4J8kpjr48BPQ4QwmAiZ7D988pF7+SRfX7sJmGohseX6PWCet2El4D/h
 /twjk+Swpf+AW2KFeuZfpzTx9Qref7Z/b/xkf7uqh0/cAv4wC7IhwzlgBJAV9Xf1RAysDGI4mPh
 rJprDzT5ex30Y36On6g==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b0621d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cq6dmUWW68VXehLBlYkA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 6fkgX3JpS4bA7LeiyB66mJ1AckuFdUsu
X-Proofpoint-ORIG-GUID: 6fkgX3JpS4bA7LeiyB66mJ1AckuFdUsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
