Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560844;
	b=JkW35xxtPMh4B6NhLN5pDEIMNUdkmzluKr99sriExnEPVNzZ9fYdiWGCal2EJRMlSO4C
	 x/MAKAEp4FgqD11ilRJnwA5cIHQH+hBZGY5L/BD8TXRkD0J0IQ+LlqThyHAqSUglrOFul
	 oaeMBF1PX8a+LUyU418fNPGxFqOknKHXqy/h54Ja4SBnoryYVl3WS7rYA1OyaUX2eeGWg
	 V3Q6bKPqv/xJosaB8vQdTFcqNUdFYisK0+JO0pTVE2j6kzcc4xq+jxxE6u1+eoV/jTxHF
	 Wn1xNgO73R23+4rSWIsG3EzYqqJSHmeTe0flqukiZERVSiNqwrcwGDETZczwmi2aIZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
	b=HzlMSwQP1TGbyYNqFTo53F6cNs5WWfJclI0MMwtYexfZcoUchZdcQwSd7UZ6BBAYZ+9q
	 316SbuHmM8wzW9F6ID/QZurH7Y0JYSmSt0TNyROU8qkRaRUHNpC6SPNjTLDr0iUBLWexq
	 e9ogOYQHQ+9pDdL2t1OmpQbad1OZLWiP5AYkMXR7xXOp717Om4i3rSwzUm2GVsP731DVN
	 8+JRia7gHH3qfTKRCFNT4sUloAK53oGxc8dzqQUAKTozMSA2DBfUcE3OWMsbF3rfbr/Ne
	 7nobDurtx/mEA80O95NBz8mPK1bOP/TRzCcM8wIoTBRII9y5XKEkGfFvStDF3WWfFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEDD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEDD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMadRm2557972
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=; b=cAqieYB9PYXK9wiS
	seI4bz/T3gnzW8qzi+yuIyLTRs8jAWSgvmQkufQpgBtfBxkLJFk7SIYbHC/xsbok
	jh6Msd7xe1jvC8KyRKH0EsCOkm2u/14MD8HOm+mw7+B4PmlzwW/X0/FyPswwznvp
	M8uZnBAla1Oz9CrtXeu8hrpOZjFkwfd6NmyFCv+xR2xqzcaLH8v1obEaeWIhYvUv
	huLrIDBuYIKdcJzADv3LtdMzcx+1GC97fgBodl2R8ybzthWXaY3xPDXtiLTMhJT/
	5kjNwI+SApe9xU0IYz3pjwelPKJZDQeE7CuMeJkIa2ky+jd71nh0zPMylHIISVoS
	5W3eYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnghnfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5959913c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560842; x=1796165642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=YbZz7GvJaDPZrq6KVAf2P/gcD178BFZ7Cn2ik+SCe4I+I9fPkXlbMKKkEeS3sdP844
         IZSNeza/MBTGQCuYiR30ZfoE9QpniiucU3kY+tSJmDoBjdtpsozdrvobKM9006wY8/wH
         ImwM6xsKXJHLXDJaxrSI/MfYmWkxemq/h6SqXb4det3DMk3ggoFDYP43t5cVcBJZGJY7
         4lkGPwqvSpNWNey1xg7u5jXcz/4SoJ8BA5L0oBSKWPcGemfrqdeydry8LQfGtJwu4ak+
         x9aqsDJ5oxcZbNsgk7SszzpgrTj99ZPnigGyoJHez72TPaf80IVZjrm+G34Dg/qo3+RZ
         x26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560842; x=1796165642;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=DHHOEuBZkOXVpygFjPO58AqAoqVCOYQrFNyd/tZQO0ADTRdh6A642j5ahc/RgClSSr
         tnST/lHQXSuQ4P2o0gs90cLEDYsvcn6Kof+5ekyrXTYtFOGj/45ElpJ3E3r3bF/ZeO/U
         3d8ynT3pv3sGtGHmuHytgnOn2krYZcX1EwFBfIhqWF/7i1f0ZT5i4k+OEWv4X07W1IV8
         g8bEcWoWYTonotdup225DcDQT9qmtZQf5UyaC7O0h6ILDZ+ywYkFMllSlGLRT8/ZILv7
         gX+MKb/GWZ+QUo6H572SnLXXJMsUFIWTqE5sl/Uuf6SJPJo/i1XlVkwL513u9tSihcG1
         M0Vg==
X-Gm-Message-State: APuU4Z+6bB9XSRp2vyANLMj+EEU+9iKjjuIGZ2O5+WsXptwV4g2235FB
	c1mdkWcO0AfiwkgQeb7bjnRAtJ5P6ALEk2R4GfD1FA5xFmSf3R0gQNhVdrZmb1nBy2Yh5ynAw9x
	3UbnqfFvP5zPqTPoK+6gHDm0vhrQ649sUholBwy52nJOLnxXBZj4LAhclmk15dgrvJlI=
X-Gm-Gg: AZFdTZfouyq5OSIE32AmeiMmDc1b4cGdhRFdoLj/Z6THETcwpHZ0YjWmWzokPt+a1lZ
	3lbvwDJ9w07sSKMExr3hzJ8/baXrhTYqCK79jlCnY03BgWqZQ2ktUSDfka6DJ3CNobIYvdov0Rn
	YS0fb9AZLNczAryJwGzoV4NZqe+20zyhVkuHWO3VKF5gcEt9jYLz0NWENVYkq0teeRKki1mt9Tt
	O9wytZWQyAGwMsAv2o6lJ8+6aEIbTE5LuF4Gsu/W8EWxlf5iG7PAJ92Rx1e3Rl4VkVHs7r1eJAe
	lW8Lw10Mnp8LORhAMn4KR3GYiylRSTPebnv2tgqxYIUskjoCpD90RVZZq77SJpbFS/9D3lHsEwJ
	oF2SCulF5/nTI5UNBOzBf+3W0rbmGIqBwzKoYBz2awO4Essgvkeos+r1Cz3r8dVUVFQGH6oUi6A
	q6Fux1rnw5Y7tuJ1XMbO7YhPVE6Ro=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571054c88.38.1795560842362;
        Tue, 24 Nov 2026 14:54:02 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571016c88.38.1795560841728;
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm26179110c88.4.2026.11.24.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Date: Tue, 24 Nov 2026 14:53:57 -0800
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
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <20261124145357.00003e9f@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX8t7eD2SZSIS2
 lOYXrxZs/Xq7qq+wGe6ln4i/QsoATXwchgCTC2pHxdq89ZCcv0+mv88X9G60756cq842BEm7fqy
 oyAZcWIx569WnHALhDNsNwRMtK6qzmQ=
X-Proofpoint-ORIG-GUID: SMpJZ0tZK948Jci0L5Jza-Ng2t5rqoK3
X-Proofpoint-GUID: SMpJZ0tZK948Jci0L5Jza-Ng2t5rqoK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX7XTnmJMZG59U
 45gW2AwhUPK3komzJGFv1Hongff2dNbRbkHVlWrfhGc7RD1vSsC/Ke9OId1NLDLrBp/p0n8CCvr
 l8hnmVbfIVl68ZprqHCjmEZOMcMcJFg8yxGI/yDV5HytKgktfw6b+j7VdmQvh1OAf9m0FVIu5mG
 R6yMLFD6qjaItTLWOIW2yJKWb2HYbuyKk9Xl+gxZb+6Z2fQGkoNOJob+1HSNxcXqYs0E8OW9mKP
 u5IIRoWfALWofyl4yTYH56z/W5E/MbDFzjWsTAQMVhs7VTpTzUn4ZwhwOX8uEEdcjAOzrYF4+Em
 goDgzWr/QUucpfJaFJ9lsExM7e+b0qrRQKkxEvRbEvOjO+i3YY+RgyWtCoOJKuyRjZ117lB62lg
 tyHDSeaubVDLvujjqRs0uv4oIRKZDeJkUeOwU+oohwAe/1wcxUqa6ZSpa8O2lfVXVIY4uqoopjy
 Z/J89gIPVrouJTbUp9Q==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b06158b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=FV59EcnNoF-tUHG6_8cA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V17 highlights]
>  - addressed more Sashiko reports
>  - added a few more SCMI Core fixes that ease per-protocol logic:
>    + added more consistency in the SCMI Core Iterators machinery
>    + added centralized check (SCMI Core) for truncated reply
>      + Reworked some SCM Clock behaviour to allow for truncated checks
>    + SCMI protocol core initialization refactor and fixes
> 
>  [V18 TODO]
>   - address any remaining outstanding Sashiko/reviewers issues
>   - address pending human reviews feedback
I'm lost.

Does this mean humans should wait for v18?  I'll assume not and
take a look anyway... 

Sashiko is moderately easy to run locally as long as your company
isn't too restrictive with tokens (if they are say upstream folk are
complaining and ask for more!). Might not be exactly the same
as the version here but will reduce the noise and versions on list.

Jonathan


