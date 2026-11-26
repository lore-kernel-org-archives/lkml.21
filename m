Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710285;
	b=S+xPjfIrt5EcUZwtG6TMYF9QqLKWpN0yvXvrECG3X/00W+TpRnjVXikBRKsttCDfr+HW
	 Qjy8eGbxcczoVPTMVMTWlBLl7+SXDGGiW2DZTI98wg5/gKhI1OdfXmuFQB/tB25CvWqZI
	 t3Q3+JORWFR/KighHaRZrlk0xQAEmdBLkrHMXxPDDr7IpqH0jA+bAAvezenIxOzrHcmU2
	 do8jYd1t1m0MyXn/qTb17d4m3yYPpcsZ+WNM1AlWPryPcQVR4HBsvt2zi+VwRZ2ah2tFj
	 CzWKk8Wtk0tfNZ+uDgZceO6/4aJ/Kef7XwIEuYRqczCEuQHLswGqNmI7ZWA1UUvJp3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710285;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=MtUkADv/A+BTNbQEb8l6Q8XLXOE4v8iG0wxhYlWB784=;
	b=X10lnHs8MRy6Z/1hJIJG5twEfA001lMQ2oityfFBRPTZa/4bhwC9HVGkh+KdksMKs95q
	 2haCCenwHp9oOauQFL04+7wSPMtvkhzdyJDIIngsxcuwGBBlppoU2FsHkTUH+EFs0j41u
	 FcsAQpQDB3j8KzdX4RIY3qEsSxbQMgSEdI0RDh8CkrdI888rgJtOlClnEJgteMD/Dk2qB
	 NF5a6vYzj88kZtnAUkGG7Bya+zvo4iMudgbUb1f+1vL275CT3Ltf9NQSoTEVOPioUOHDU
	 y2JofsB6zyYfUpJIb35DuHn/M1a/a34njzLLoFbdUn7QYEsoX7ktWWSSzWRwYyuItvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9JCE7+8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69082606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9JCE7+8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106B01F000D1;
	Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710285;
	bh=MtUkADv/A+BTNbQEb8l6Q8XLXOE4v8iG0wxhYlWB784=;
	h=Date:From:To:Cc:Subject:References;
	b=V9JCE7+8ko6VsqISe1ZProUsZ+PDnm7R0sB225TNRsg1Sr2Z7NYhElv5OM6EOuaWf
	 flzZnCzkW2sijFY8ntmgLYqjernc/2jdTQGqek9OsCVo9p6H7iCeV6uzPpvA5pfDk7
	 5u8bYD1f4M6IZ8EezQyJc4fP0DJDIxPFNRBbsmOifiqaw7wK5+iGWsYBX6TLZs2EsO
	 nSh1OqQx84Xz6gcEIfLgB9cf03+TqW9+MkJgSZs/ePKqhXSCopEZAd+SkD1IrQ2Nn2
	 ME+3ke5E9UTUJC8dM/baBlNRFQT2QxmYJFVLmtqkdEOZOR31GtGIhXhj1i5DqRVEPq
	 BZHhIQENtyuFg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH6-00000007bjv-1jor;
	Thu, 26 Nov 2026 11:24:44 -0500
Message-ID: <20261126162444.222523245@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:25 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [for-next][PATCH 02/15] lockdep: Add #include <linux/instruction_pointer.h> to lockdep.h
References: <20261126162423.442922469@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

On 32bit x86, _THIS_IP_ is not defined in asm/linkage.h. It happens to get
included into lockdep.h via kernel.h pulling in trace_printk.h which
includes instruction_pointer.h that has _THIS_IP_ defined when linkage.h
does not.

In order to remove trace_printk.h from kernel.h, have lockdep.h include
instruction_pointer.h directly.

Link: https://patch.msgid.link/20261102202407.305916932@kernel.org
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/lockdep.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a..c6b0168f5fc9 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -22,6 +22,7 @@ struct task_struct;
 #include <linux/list.h>
 #include <linux/debug_locks.h>
 #include <linux/stacktrace.h>
+#include <linux/instruction_pointer.h> /* In case _THIS_IP_ isn't defined */
 
 static inline void lockdep_copy_map(struct lockdep_map *to,
 				    struct lockdep_map *from)
-- 
2.53.0
