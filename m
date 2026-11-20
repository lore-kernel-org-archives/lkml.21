Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204484;
	b=Dea4m/RzVkp5N91qBjSvSikYCXuAaKWmO9Du+CCly/whUoIHcrpwH8fmOo9T6GCWVlgf
	 AAWa8WLCcjzmSYB/8ekDmcA01t2OGWQUVJsZdZpqqif7RyIH62BLZohkT4hhCPywbHhiU
	 UVE+Mi6w+PMb5ijfUteIOSchDZWbUlWaU58p32OTY6M07i0GLYCDfXelWGKZ/hcT/5pkT
	 deK0AW6j8jhviyBP+aombxX1VhBEnexvjlPS2vNBCwWBtVm9MxMFQg7G/5xTfEPYINn/N
	 O3GSlSS5snxwf1UDYDsay3TGRZrBuC/yKD2hKBZ71Xl9+0pDQBpqvEMRImHb17XzwBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204484;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=gj1b5yHNCRsSxITf+NlL/XhLqaTHJQV7A7mom8aduVE=;
	b=nd8mFAt9YkNM+pXcByOettlovSjHdqGYcSttUkrQvlwWI6TfPkEPKU5Bo3g3QEFf2Yd8
	 VX7zrNdjwhRvj/ro2v2Lf1HJ0fYmI82jzQ/0jWWX/LOczS0Z+jqBB/2/RyervS/NwxkR3
	 7mJgL66ZLh+DBtnybyjMLgeaDL8byZfZpz3FtIVTSYF3auLN9WtwE1Sw3OAMiPD/wBUq4
	 r8WtkPR8VayW7WjEHVFUysJUQUdvAWh5sGuHRjcAzVu0LGrL9/YvDLrhopcw9OZeu8BcX
	 WSrDJdQycGv6IZlQekDRWO3pTQYl9J6hWOT2+ZwFteslo+navMZtZMlbwuHBqMKXpXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80D606A6F3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D80D606A6F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHAdZw2337671
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:43 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tcjsamx-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:43 -0800 (PST)
Received: from twshared80817.17.frc2.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 19:54:39 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id BCF5F2F4934E5;
	Fri, 20 Nov 2026 11:54:24 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Nilay Shroff <nilay@linux.ibm.com>,
        Hannes
 Reinecke <hare@suse.de>, Qiliang Yuan <qiliang.yuan@linux.dev>
CC: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Hannes
 Reinecke <hare@kernel.org>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
References: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
Subject: Re: [PATCH v6 0/3] nvme-multipath: requeue work fixes
Message-ID: <179520446477.200156.16466129687568880255.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 11:54:24 -0800
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
X-Proofpoint-GUID: VYlxaNQj9jO4coVr76Iq2Ic0b_5vJcue
X-Proofpoint-ORIG-GUID: VYlxaNQj9jO4coVr76Iq2Ic0b_5vJcue
X-Authority-Analysis: v=2.4 cv=JYcpPkKV c=1 sm=1 tr=0 ts=6b00a583 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=VwQbUJbxAAAA:8 a=ndKsy8TY3o2_kMQNOlQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX2IVD5vZ1Gdir
 fErOzU/SW1sYvUjA2ERKnWquKiv4U3iPTaWpNBqBoaSgnPQoXvz9L/SDn5urBZPgjoD+wqAbNy5
 n+5i1xVf3Gt5MhPEvKdYr1fE6BOmJ1vyn6DpmffRGBKtE0RwL4znYC3rOqscMwXC+qEBKOLrRJu
 Nw6nf9fo9+ev6jwjT1QXXyHANPcy/bnJZA/q8p7DCeO+F8OM1s59fDQG4easK3ZwFxzYwV8zoqa
 NjZvvRBZpYCXKu1Ypl/ha4R8ZS7ynKoYbc+jEcua/crRqvPUDnpN30109t5hrdg9ZJQoj3uXMCb
 y4UHo+WZ3RcIJyKRrIU2qLfuF/3G2+IXO+RwkEHV+Fz0Y6UhjmiUoDtHU61FntHHt2Nr2l/OyoP
 OsN2Amkc1KFd3tsw8PVn5JTzVUmOm33ropR274RXgAd/LPcKa814G8zQMImBvwF5bl3/QjvICol
 PpoTqg2RAOsaVVIlaBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX2lxMGhZOWQpk
 X0eCa6jy824Cy/iZMNTxqcDOyoLMcDHsyNcmLkkWrw5jvSQ8Izq/m6izrpWNvBx6MgJI4eLne04
 Rqwd/97Kq8a33Oo4svTLJqloWWg4j8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

On Thu, 19 Nov 2026 20:25:00 -0500, Qiliang Yuan wrote:
> Patch 1 keeps a large delayed_removal_secs from wrapping around into a
> short delay when it is converted to jiffies.
> 
> Patch 2 applies a new delayed_removal_secs to a head removal that is
> already pending, so that clearing it fails the I/O queued without a
> usable path right away instead of when the old delay expires.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/3] nvme-multipath: keep a large delayed_removal_secs from wrapping around
      commit: a280772ee0a8a1f2ac769be4d88a5c52ef5ed743
[2/3] nvme-multipath: apply delayed_removal_secs changes to a pending removal
      commit: 536a72ea54f81ebdf56a2a0b31d7dc0fb2837c1d
[3/3] nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()
      commit: 3ca1ccf527aae210ecee2905062dd6da0934416a
--
Keith Busch <kbusch@kernel.org>

