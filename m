Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204489;
	b=XQj/IXZZ8VPKA2DykIeC/v1NhVCz9YcLSFxY9aApVdlCIBzkdVCo7T4LsP8ckEHeAlXU
	 Ft1r7POCh/3kEoE1Y9XqjW0Yt84WqyjpIDACsK5S04u6CkdYHNWHnCGz97VAinUufNgva
	 y6jsM1XsakrutFlfa9a1nUlrG9tWre/XWY17q84eyFUWU2sqmyIm26XbJiHPmeHsDcpxZ
	 aumYj08rY7d5Sxh5h1w4rwgqFbU+uySLyxWWjy3vKfYjUlm6rGjWJhO1san930G60xHzQ
	 jM/s3WGXLs6SzFizewdpWCeJL6pppzk3lGpC3LlU7/n/sXvz3OqNZ6N9+eC5C2kl7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204489;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=eo0+yx3GhZH+2NEI9cv9dZEY9GTkOnGCKzMkei2rOj4=;
	b=oJstGJbLYUnw/griM5G9A33PFZJGhXZtxAnM0aSmWUDPPCS+EM+kRO4OjNl6kkSqI0gH
	 TZ5PXo4C5irMZl6s+hHV+nMRr4bDRCRCpFD5/0WDeoE0zNYmZ1Dtdme9m/QruOKDwk1w/
	 cHlU4EWBpMwi3SP8/FGTVPxV8jRDreKXtMXGchi/x+LFLgmmRwUEpMMsloIv+JWKyoV8T
	 9wymMX3i2SY6faHm9L7kge3LuJVI/l292nkDSbK7ZeqvWDhtIWs2nJwEyK7pA2uarSAbT
	 xwW1ulieQi3V29w5Z7FtWTMArgTqVqHHKgMf+shycUwf/YLNRsy88O0Xv6CNaFeu0hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B4606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063B4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGwatX4130555
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:47 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2t6vsdup-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:47 -0800 (PST)
Received: from twshared24494.03.snb2.facebook.com (2620:10d:c0a8:1c::1b) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 19:54:40 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id D42FD2F49353A;
	Fri, 20 Nov 2026 11:54:35 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <linux-nvme@lists.infradead.org>, Gleb Chesnokov <gleb.chesnokov@scst.dev>
CC: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <0099f610-a48b-4557-8515-e4df444262e8@scst.dev>
References: <0099f610-a48b-4557-8515-e4df444262e8@scst.dev>
Subject: Re: [PATCH] nvmet: report backend transport errors as path errors
Message-ID: <179520447586.200813.7403174515660179966.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 11:54:35 -0800
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Proofpoint-GUID: 01ZIFukv5TueibqQM6eDhcT1BUu9AR3y
X-Authority-Analysis: v=2.4 cv=CuQq4X4D c=1 sm=1 tr=0 ts=6b00a587 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=VwQbUJbxAAAA:8 a=iTW6AIvZo88YF_rOJHYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: 01ZIFukv5TueibqQM6eDhcT1BUu9AR3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX6F29WMWJosF7
 MvctdqkIFjCkQ9HrxxuzA8/wJtx54ce6tkRD1QHz3Nb432uDXKvtcOZczwOYPDl3GbLldhuZ+nJ
 CFpbqKc/jJmEW7neHzajz91kWQmxUlpSuVVf+xqIE1N2gWz3Yw4RCv93AVqsSw19c7Rkxga3QFm
 P6es8llG3MgATLSh3WM1/HQqu1tQ739uixn/twPJOUkZ2Lci30Mmk7lx6+nQMEH9hiqfJ9+NdzW
 ZQtACaqB2gbXMRFwmdwAxDE7JigB5PMGFTPpILKMojPNo+tF/FBcl2/1TYGxB17ClkIpgtPNX8i
 x4uqpsJvW68Z/qqt3BeB79gbnBKvvQ4/gRD8wB7xBpGb0qFsXmzihPIonraHYt0jIKnIeiF4++y
 WU5/9ctatXaMYAPPQa+KB1Zm/uK9xMEmIA3lBnraqSkv91kZV1JBbXVreaKAeCUxX9PYa2KjHj9
 v+L/U9WFQ3R65GNvT3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX4J+Ic6+QHwUA
 0K9jE3/MGc0pKNLW4j2iIo1WOnOKWGj9wXLLCW1FzfBbWZUqiyRlzRjA6Gt2R/IVBoPFSQxi9l6
 ZqU8kFu+ro+OHQ6fx7//0VQuGZSHys0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

On Fri, 13 Nov 2026 14:02:47 +0300, Gleb Chesnokov wrote:
> The block backend maps BLK_STS_TRANSPORT to NVME_SC_INTERNAL with DNR
> set. This discards the backend's transport error classification. A Linux
> native multipath host completes the request before considering path
> failover, even if another controller can still access the namespace.
> 
> Map BLK_STS_TRANSPORT to NVME_SC_INTERNAL_PATH_ERROR without DNR instead.
> The transport failure is behind the controller, so report an internal
> path error rather than a host path error. Associate the error log entry
> with the namespace, as for the existing access-denied status.
> 
> [...]

Thanks, applied to nvme-7.5.

[1/1] nvmet: report backend transport errors as path errors
      commit: 3b90e37012c0c5297ccbd7b531287b943c818bba
--
Keith Busch <kbusch@kernel.org>

