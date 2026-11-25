Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630824;
	b=OPQfRShDD3K6mmYX+Qy6HxWLDfQQk7ukNhdTJNQkTuLMu1zZ+8slS0pnt73pbZraJAac
	 /s8DFfUegq+j6oCn2oQ+/tKZS8lr17xsT/4YNGjFnVlfrbljBTfNpwHGtpTNDkUuhYLq6
	 dSY64mZhPwVHpIPpIVcUdba4hipWM0GuZVWsDWC75g6HKWNk7lD5oag5ulZRNSO+3Iu/N
	 ZaueABzAhIsqCklBN9Ar6aP/d0V+QVcJwyuF1UKoZ+tBKEnt7u//3y93GRRTXNdYsre/3
	 PEEjZReH7XzY6jROiTgGYt4LydqbzGBOgpDOerqpeQCZ7wU9APXInSx1dLBC7/EJ5Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630824;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=d6lSH1p5VtALWYwpOsdco9PMo2Dm1+g12cKoPv20GEg=;
	b=Y/V2dytWa61NjbG0QCT3pWa0r2viXh/i05wubB0l6QQ88oersfhTOVkVlEAY7fEMpbJt
	 jwS90bsSLujal2BVYEAXz/fPoIzr2YeKVu1XWQG/y093P9DOaoYI5PoSR8p+ctSXU75sQ
	 e4FjfpodSyB9dGmIYktA+pb3GiQEUTy9wOWW3wgYYMRJ9/bijfynn6Zj3mSHrmZviT3jE
	 5pmQ1hXgFy5iO8YB1F7qiorqpBYA9dhM2EXHqxq3nu605VTtoTcdcpkA3FUZkHG7qK33k
	 zkI84sT3F4Gy3UMMNshoqqAgtSehSloaDndsu35/rHlIYsd7FFUbjfdsujD79X27DpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWd4xIwu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWd4xIwu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF91F000C4;
	Wed, 25 Nov 2026 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630823;
	bh=d6lSH1p5VtALWYwpOsdco9PMo2Dm1+g12cKoPv20GEg=;
	h=Date:From:To:Cc:Subject;
	b=EWd4xIwuoGQURcU4mHhC/Mj5lqSccHk5h0R3E1OYILJkW2LRUECtf4l+8bFN+owAB
	 Mcg0OcxWzWcN4I5VRJ8q5cT4C2RiqeOkHEyevbhIzsVQPbnDcukallWZbOz741gsIQ
	 ztW6XfQHmCKLfwuxs6OsWtUWeHT/E2JKh9mL31yGebvSulkyKbtIp1IFPWrVcKUPCh
	 Y3Kojvz22XfcAGDhciwwGXvPovplAzu37HaaGY2MqGdfdcLm9PkwxR6CX64LshRyS/
	 ym8kiJWiEVzso6t4joaDtjQ/pCYlMl0ir1F4lOiTyFfVU0Dh7YILFaf7LBW1xqUzye
	 INoedBSdq2F2Q==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWHbS-00000007E65-3r0q;
	Wed, 25 Nov 2026 13:20:22 -0500
Message-ID: <20261125181952.861853319@kernel.org>
User-Agent: quilt/0.69
Date: Wed, 25 Nov 2026 13:19:52 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/2] ftrace: Updates for 7.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ftrace/for-next

Head SHA1: 976c208caaf22187bb19c0efbccc73da86961584


Yaxiong Tian (1):
      ftrace: Speed up module enable by binary searching module symbols

pengdonglin (1):
      fgraph: Format error pointers as signed errno values

----
 kernel/trace/ftrace.c    | 124 ++++++++++++++++++++++++++++++++++++++++++++++-
 kernel/trace/trace_btf.c |   7 +++
 2 files changed, 130 insertions(+), 1 deletion(-)
