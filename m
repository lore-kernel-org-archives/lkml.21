Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099689;
	b=qlGp2U7CgssZXDT36O83TsfMxCzCWy50RKf6/oZgunC6cl1VXw7s4JlHs4iGaFOkY1CF
	 yU72+gSiTkw/snhP7xEc5kKPVKaiA/EVbD8mb5jy0MlpNp1hKA4TPYxaamgk718qWPOql
	 2lve1JO+lo9eAAo2V5RVeaNjN8gOMYfkbzDpIEe0coZXTeZU+YX234LEiKWNPmScF6+Uj
	 rcoYtGqK6fnV5s2f353hJKuankSzcuqCmHkrUpkGLzpPjg4alJNGfK1JM6DGQEJ5VPaMQ
	 lFsV833ncf2Jok9gOsMJYUQGVfqZ0eoTjsbb7CyBD4rb6lgmAS5qBoeCywL6mT9zOgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WfwzF6YLPZnszYKqKeqJ4Jq0kQjveK3i+mWx4ys5gFU=;
	b=BFcepKBysnR9ZhYqu18l5YaFEJm3VCeEzbA7hNn+rZVlODhhc/fuQjTnnCTeR0bBsUyD
	 bD/8vM2RVLa0IdECvcuupLREa38hmB7LpisBmBjk7VpmkEN9BiAgq3my+zH8kfdG+0tnJ
	 TtRYKgy7vl+Cy4ZSawFzvtNbIpBSbc4hviWjGuNVejOxKtuiBNWAQ7XhLf2inDzlAYnPf
	 QcJBbmJYfV14nb5etXBXSGyXnekUHWP26hDS3MTkiFtfbxeRLiv+rOjJ1nE7PsO6r19oB
	 HJCUw5cyqZ0YWhjLDGjCun9a7dSWkUwUtPqGc+BWFks18DzSpxnLVt3AMeVTCI2oVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=R9ZpbBaZ;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70E606E8AB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C70E606E8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=R9ZpbBaZ
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJEleNu018080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=WfwzF6YLPZnszYKqKeqJ4Jq0kQjveK3i+mWx4ys5gFU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R9ZpbBaZ5lAIY3jBr74iUhkqxdcYq45dkrv5QwJksNTmGRNvAsRqd9rKCqUabzNu7
	 vLWSDEWL9+koNS1+adTDzujV0hBdBoQYCnLpomRG9jhCbS6L9T61rnmyyDPUJDPdIE
	 okKl146BUqBtaoTpTm9OX9r7kvgAuOitpshrtuY0ccEuiOb/X0u+BOpykFQnx1Ta+G
	 Y1HDw/x+LbQk6R11Gtrtj33nPu61wOFZxOjriIVE/InpJrJibkpdluVsBLRxHEcERc
	 QYdM0pYasgFTmiJK2q9C0S+Y/QdtOmlVkqmRWXJhXGcXzNj3VzWLhsky1beImy7qaK
	 YRdduDrbjsk4Q==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 2F02D2E0187; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        JonasZhou-oc <jonaszhou-oc@zhaoxin.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Jonas Zhou <jonaszhou@zhaoxin.com>,
        adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, jack@suse.cz,
        ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com,
        linux-kernel@vger.kernel.org, louisqi@zhaoxin.com,
        jianhuizzzzz@gmail.com
Subject: Re: [PATCH v3] ext4: move orphan tracking away from journal state
Date: Thu, 19 Nov 2026 09:47:04 -0500
Message-ID: <179509948671.1938961.8760397386609703759.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <67ae57ef2ee3ac27ab844c22594351c83142d86f.1789097450.git.jonaszhou@zhaoxin.com>
References: <67ae57ef2ee3ac27ab844c22594351c83142d86f.1789097450.git.jonaszhou@zhaoxin.com>
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


On Fri, 11 Sep 2026 11:31:13 +0800, JonasZhou-oc wrote:
> In the tested x86-64 layout, s_journal and s_ext4_flags share a cache
> line with s_orphan_lock and s_orphan. Legacy orphan-list updates
> invalidate the same line used by unrelated journal and inode paths.
> 
> Move s_orphan_lock, s_orphan and s_orphan_info together below
> s_journal_triggers. This separates orphan-list writes from journal
> and flag readers while keeping the related fields in logical groups.
> Add a comment identifying the orphan tracking group and preserve the
> existing member comments.
> 
> [...]

Applied, thanks!

[1/1] ext4: move orphan tracking away from journal state
      commit: 2a837444e911ae75e24e71b1c2a32b6d6e1ef8b9

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
