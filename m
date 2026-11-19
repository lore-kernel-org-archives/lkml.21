Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099696;
	b=k9G/mFXkvrNDCoWjItafU9dUTSTMGTQnHQP0pV/RjwOndN6iLDRfbrpw+7pDIw/0SfPR
	 LCKay6AYCFeaCaXBsOqSjjv9QBDWfgt6bcKWBtxAEucFIrCPQYxgkEEJds8EVKJf5I3tW
	 CNdgiyj1Z5UCavz3JVeIdICG/KI72BKhdq6oDpYDDm+qhF+TcvP0qshC41BQqA2RNKrxS
	 mo4JK20t9wC0aVXBI+iCvTw5iS8s3KaYs5OGFgqy3r+wrt5+uKlkdFeRw9CZMJ2CLcieH
	 VRZT4vDYN5YQ+li8hK/MX9PPBQCY6L4TvhRkiCR4fwXYPTtZse2MN7+c++LjIu7W0ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=oGiLuaAXbVTmodE93Bi2QufGuOl4dv0CyFDodMAbA9w=;
	b=fl2kKqEXkgdti8MIYN8bz3vzXdPDYGm2kMzlVFuZlbYH5aL7cjyntle+EXwVfyC5L4MT
	 xyA5bpsQ2jCAUmjdS0wCcQMnd9hWbKazIB9L26Bd9fbPa3J+gIf4IObbJ5nUZni5a/Rqn
	 k4Bmf/B1ZFW52UD+le/9TRH4aVPDo3fWFjpVrFGamIFsjF5J4NxFG97JUPRqS84aRgXLf
	 ejSZ7GEPHMxDcpp9SJjlZwWtwTb8gubsNGchajx4+pa0e2if4PBynvOA62W4kkwXi01kv
	 hSOvy6Km34NfE7AEa0PrpkG6O4heC3Df7hEwPTJ9Wc4ywB4vLihg4WBdkJvGe7UW2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UjFPYLNT;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981BC606C334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981BC606C334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UjFPYLNT
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElfVs018190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=oGiLuaAXbVTmodE93Bi2QufGuOl4dv0CyFDodMAbA9w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UjFPYLNTqyQjF+lhbBhX3bboSMCUiNOGuQ99Un1t3u0v1Wd8ScP07gWsYO+mEqsyG
	 XchaesdM44aIl//wuk4dYML1KXg/RjjOesbbxsfFj49sbosYtnca879n16ukuy+gEk
	 Fnd+RsKoZ9e4wYZNjPIiu8GjzQWPk/pr3utlRPZxYNu6el+xLEQMx9cqDRrnBXw723
	 tUCEStikTQu8xHI3i8bK7N6cL+VU2VkIBgaY+PvErbJ5RZQjgu5VUWQzcDqFmd9fhP
	 Yxl3+FiXRKewEr7+cusxN//yPk59MzytUfuPhpFctFZONAG/hp0Is/OLDh8FDHbYPY
	 uzWn4eqWr/anQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 5BB692E0194; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: return -EINVAL on hole in ext4_convert_unwritten_extents_atomic()
Date: Thu, 19 Nov 2026 09:47:17 -0500
Message-ID: <179509948715.1938961.18167763696793669225.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023-ext4-atomic-endio-fix-b4-v1-1-f91feb0b9613@linux.ibm.com>
References: <20261023-ext4-atomic-endio-fix-b4-v1-1-f91feb0b9613@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 23 Oct 2026 15:53:45 +0530, Ojaswin Mujoo wrote:
> We should ideally never encounter a hole during the endio conversion as
> that indicates something is wrong with our extent handling. Still if we do
> find a hole at atomic write endio, ext4_map_blocks() returns 0 which would
> be returned back to callers by ext4_convert_unwritten_extents_atomic().
> This can be wrongly interpreted as a success. Fix this by bailing out with
> -EINVAL instead.
> 
> [...]

Applied, thanks!

[1/1] ext4: return -EINVAL on hole in ext4_convert_unwritten_extents_atomic()
      commit: 23e76be92cd7cdb25d53d522a01285e595c30cbe

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
