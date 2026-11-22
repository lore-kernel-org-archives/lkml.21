Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345299;
	b=1A2dH9vcBbPkuBRrWYPCrCrPsZaEY/qk4mcF6Wm0oAyCeFFG/IMpYsdnz2B00XiqpDP8
	 CDq00T0zT0cmwny4MjN2AB2Vc1yiATltz0UDOiYdlkQHc655zAkvBs7Rnq7CsBiVqgJeV
	 t3eMK6HZEpVppV/jTVqUl/68u18svRVD4aOqeHAsZbPtL7gFR2rwQZlsTJmjnfvcwTeo+
	 WlfHfz5u2x1tZf5L51PbxWEcwwscnYlGEpjzbPqMwO0QL46A6qgX4dU3Huyt5mGD70jcy
	 ACtaJc7NNB+8Gh34KbbhuttPfWlKM5fHfphJJP1VopxNzNk4lLFz2VehFcNiWy8tdqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345299;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=z56hC3/zbOpc7nGKU64JYNJgqtUsmwrK3TNizmyPD24=;
	b=zTMx8ztGFADMKOcGI5ltl06F4VGHx0sc+PmOaFeOXH+szJ15qRO8IUvWn/mVdjvR6mdj
	 EogUVzKa1kX2RnF3ztAwuVpeyK5oUClfF7LFyQ0kzKQQE+NTR3bjwlz9nH3dvU3bvN3qn
	 EL0lOc5OuXKBPH9CUr5OJYmnnIVhtx/liLgbbWkl5DhRzYW11GfJnYrJ8Tbmp2BjL2ZGl
	 KasB8U1qs0BiPiGGB2KpEZj32bnKYg86Nx+ZwsPxloW4Kn/ILGXyr2C66W7TzxP0cTYMp
	 qo9YiDy8af1HuAsxUa4Hc845hGOSF1MI2YN6X1Wn+Nys4uzjfRKtwoY8wmNd6yyh25A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IWNY/gY/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC56606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWNY/gY/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3281F000C0;
	Sun, 22 Nov 2026 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345298;
	bh=z56hC3/zbOpc7nGKU64JYNJgqtUsmwrK3TNizmyPD24=;
	h=Date:From:To:Cc:Subject;
	b=IWNY/gY/BJAE+tMkVj2Zd7vyX7vBbwXScNHePs1WB4UM2dDh/BEoM4XAyuRZOQA2w
	 zxruvIFrnUf9izjldE6nUkvamDhCs46w1aR/Yfp+gWCY1BKcwb1YJvaNUk7GoixeFK
	 WTLMGap7vBQ0/L5lA+0u+l5nCuVaIVsTMb8Xrfl5PgpCZ7FW0CZRHtxer5i3voQke7
	 k2/fHKL2ETrP+kNo5D7W2nj5k2BJ2LOsgxEkphXkl3WL7p+IE3xw4DYwKfSyrNu5On
	 F9MY0M0h0PZW/argN0o/JA9+rObQ+c5N9hImwCQztD7+3S8Tp89OFPM8GzEfYMjlWM
	 OKJYMiSwJ4rGA==
Date: Sun, 22 Nov 2026 12:01:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [GIT PULL] scheduler fixes
Message-ID: <awLLjKQ1IUKuQ3eb@gmail.com>
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

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-22

for you to fetch changes up to 342fe98c34311969950fa58a840fd0b95a16c9dd:

Scheduler fixes:

 - Fix cfs_rq::idle handling (Peter Zijlstra)

 - Avoid transient double accounting for delayed tasks (K Prateek Nayak)

 - Lift cgroup update locking to core to fix sched-ext locking
   divergence (Michal Blaszczyk)

 Thanks,

	Ingo

------------------>
K Prateek Nayak (1):
      sched/fair: Avoid transient double accounting for delayed tasks

Michal Blaszczyk (1):
      sched: Lift cgroup update locking to core to prevent CFS/SCX divergence

Peter Zijlstra (2):
      sched/fair: Use guard in sched_group_set_idle()
      sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle


 kernel/sched/core.c  |  35 ++++++----
 kernel/sched/debug.c |   1 +
 kernel/sched/fair.c  | 176 +++++++++++++++++++++++++++------------------------
 kernel/sched/sched.h |   9 ++-
 4 files changed, 125 insertions(+), 96 deletions(-)
