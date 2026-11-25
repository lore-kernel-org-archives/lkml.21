Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601904;
	b=vMUhS0519TOzhKTI4PpprumO58zzIM1HW4aFpgFM+N3WuIskBnsIEkg2aOzqUOLsMDWB
	 6mS/DrGYJ3nMMLEHe5xYE09Ewr7EawF136o7rPltLsCweUvBBznQUXDBmymNzj7l2Z5la
	 /H/KzjcoadPUGxPdVlH46EpRk0BO2hhooMbb0JkWEQAfIqjA+4s7WPgC2cpb4/5DEzQrE
	 z7BvDoYMQKCub231O3uETPkn0auD/kKRtZeU7BDj0HUI6AHpZRlGE2F8el0UiwhDWPcC0
	 1FTfNl9UXKUj2n8vTFpAfPB7FluCQZ0x8OuL7DyUIvsS+6iWfaHgq6aRHcNipGtmXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9TD3hrMBvkslfSapS5qO8i866JYkc5j0a8Z3GIrRzoI=;
	b=v2cPz1INVGSmRNuck2rTfB8YNqBFCNEWjXS48cbCP+4klH/QAxrmd6MKpZ2lb0xZlwaH
	 hr5d2STNAvcMhnYCHedNOc90N5DCRvFhCAAshK32YSTPml4WwY2gVvc7/E0e8Z9Wt50Ai
	 b+ywW+2KkVQlWDP2921dkmO9hkHxpP5rUwcEmZp5Xt+UsT1TabyAcam9VKvfdqyHI7DlR
	 I919tqUA4UqnRK0uuF5IVMmsSA9iLmiWfKcigKQ7U4Hzc3Cqf59NRNcrPOwX1Z1kKYVY7
	 /ByW6m0EkWZ8VqHFU03Y7wtV8Y6Spe85WXZtxw9ZT3Qy1lNn2Au3/JoM8Fr/4QZ3NbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dpAlrWTS;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7341606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7341606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dpAlrWTS
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-497614c95f0so3147224f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601902; x=1796206702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TD3hrMBvkslfSapS5qO8i866JYkc5j0a8Z3GIrRzoI=;
        b=dpAlrWTS3G3U82AiSkqQn6kx5AJ4vkHYrASjVHVscH85qegVUuejtfr+nWMC5yh1f+
         ZAiqp0TIie/Sej9K6jw002J7t2jjs+nV6t2/GNM48cnjE1AAWJ5XcXwmJ+f+7IJtv1Rt
         HbEWTJrNvYz/1M+KD2w9x2aeIoHBl+f5ZueHsd/B9tLMp5v014lRHUYlQJeo9eGE+Od6
         YMh3j0E/zLGmE4g9UkxiTm3e1Uz3b+HXGi2JwHM5KW5GVL7dJuyBosGbfXEO7pIb5qeD
         NUHIvuDNQEan6n7ZNwiAQ2zNA6z18eRbVdI23Mg3Xc0uJ8RKXnUur5j/3PBkyizUfqNy
         N6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601902; x=1796206702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TD3hrMBvkslfSapS5qO8i866JYkc5j0a8Z3GIrRzoI=;
        b=SoZUlCtwzgvmNodJauWGDoLPNjqpTQ5vDkyCulvAJ1LVq2kFVA60B4OpxQ1V4tBzob
         eow+bCxSkMsBWfOlIB5/l9LqyGI3PqHwzuAg2X14UIurbXFdQSvYK+O3lLTMSBpaNgGG
         b/cu38ajpAfmxV2NRkgIjBHGgU23cvehR22MY+w01zGUyXIIbbnzFK+4r8+tgd+84Gpa
         uoeAKTiZkaJQd4EJCn5qL8lyzwa3glDvNliRyj+lUmxchH6kHfWkAvzbvxYRNqUOJjSF
         1cwSKdko4CkTQvcdIbw8kUPKOF3F9/2fDT+QkxlYgJZ4MLyizRcUe48YX7QAtSkl6K27
         sF7Q==
X-Forwarded-Encrypted: i=1; AL+hErHgIMiJj+e4i44LhLs0aUxUO4mUvSqFrKDJ1AHMQ+EHWd+7/8pWa+w9XTFTvt0qzKTr6mnBi7aK7Caxdg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UauJ1hYoa+kNg5PdOC+iuiWESM/UvBACyXz0LT3bVUnM1Q9B6
	OmVp+l5YPQjTnL69kB4CWJNIQ43F39kokKR0cx6mGCyYUgnSSy/cA1PR684nldJIiGjHVz5t0ud
	3ilWJ
X-Gm-Gg: AZFdTZfL9w2A8PA4+Xbq+tDp/WYaHmSQqEoF5DDM7fInc7yxxV0XBVfLR1AuQKT7lvM
	amFpzMEw5yflXpU5/ZWNCuTht8nvmlVHAnra3e9+9wHmliVIxPZDge14BLw/CxbI74H9yZ6Gspu
	wMusKacVZKpj06nV+e7kpXyU7cjomrtfH3NzX1kxuBD+HGZiXdlPyc+nuFRxVHtLKFQJb1vENBp
	9uiJMcZLEhgTt36jdQHbFi+KT2MpP9gmcOXIsz6nNZKdIakWIAPe6cfxp7S9oDLuhditTlKjcfj
	q8ZJtjHGhKNX77WY7PoBzfDlnOenxrvNGtUvXMCY53jh/s2E8Q84w5ngXW1B+v51s26hbU+tRwq
	wBdK3Lyq3bpjYHB12eDFtIAdrAgRVdaRdgUfwurV+PohFXJsbQLwaPRyLFOS4pEXKnUIHAbuU/m
	uxdoUKmJXjn63d4pN+o9ZmNxzhTyi+35xqmLkoLkdSQHkCcImXXjl0PxO+sJepzSdTckJw9Gp1W
	nzDcxm2WYh+koYR41+S6gTmnWEcyTugnR7NL1RrLE0CX+rhEF3MYQ6F770bVbtyowwq6g8EKWj3
	vBZ+mve6lXfPFV05/D6gFsExthHED7AHGw==
X-Received: by 2002:a05:6000:4b1e:b0:498:bc2a:8f31 with SMTP id ffacd0b85a97d-4abb0f3c1f7mr33443458f8f.19.1795601901913;
        Wed, 25 Nov 2026 02:18:21 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm33972876f8f.53.2026.11.25.02.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:18:21 -0800 (PST)
Message-ID: <79ec2b9d-ee11-45df-b579-2d9aca5031d0@linaro.org>
Date: Wed, 25 Nov 2026 10:18:20 +0000
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
Subject: Re: [PATCH] perf build: Only enable context analysis with Clang 23 or
 later
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Arnaldo Melo <arnaldo.melo@gmail.com>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
 <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
 <EC27692D-9692-4976-B7EA-4C3A91173CE3@gmail.com>
 <awSu48pUIh942Zm4@google.com>
 <46a896ba-cd45-4747-837d-50ea4b4dbed9@linaro.org>
 <0E9F372C-C100-41EC-B5B3-46FEDC813E01@gmail.com>
 <ceaea0f9-6f17-4626-bd55-fbc7366905ce@linaro.org> <awXewmptfc1za12c@phoenix2>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <awXewmptfc1za12c@phoenix2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/11/2026 19:00, Arnaldo Carvalho de Melo wrote:
> On Tue, Nov 24, 2026 at 01:43:59PM +0000, James Clark wrote:
>> On 24/11/2026 13:08, Arnaldo Melo wrote:
>>> On November 24, 2026 8:24:37 AM GMT-03:00, James Clark <james.clark@linaro.org> wrote:
>>>> Looks like __guarded_by() has also been around since at least clang 18, so that wasn't the issue. The problem is that it's not supported on struct _members_ specifically until clang 19.
> 
>>>> I sent another version that stubs it out for < 19 which works. The commit summary changed to "perf build: Stub out __guarded_by() on older Clang versions".
> 
>>>> The header diverges from the kernel one which isn't great, but I suppose that's better
> 
>>> Right, but you changed how check-headers.sh treats it to cope with the difference and I'll make sure that tools/perf/scripts/sync-headers.sh handles this case as well, namely if check-headers.sh detects drift, sync-headers.sh will update the tools copy while keeping the tools specific parts.
>>>
>>> acme@number:~/git/perf-tools-next$ make -C tools/perf help | grep headers
>>>     check-headers         - check which header copies are out of sync with the kernel
>>>     sync-headers          - sync those header copies with the kernel, creating commits
>>> acme@number:~/git/perf-tools-next$ tools/perf/scripts/sync-headers.sh --helpUsage: sync-headers.sh [OPTIONS]
>>>
>>> Sync tools/ header copies with the kernel sources and create commits.
>>>
>>> Options:
>>>     -n, --dry-run       Show what would be done without making changes
>>>     -N, --no-build      Skip the perf build verification step
>>>     -C, --no-commit     Copy files but do not create git commits
>>>     -f, --filter PAT    Only process headers matching PAT (substring match
>>>                         against the kernel-side path)
>>>     -F, --force         Sync also when both copies have content the other
>>>                         lacks, after manual investigation; tools/ additions
>>>                         dropped are recorded in the commit
>>>     -o, --output DIR    Build output directory (default: /tmp/build/perf-tools-1000)
>>>     -v, --verbose       Show more details
>>>     -h, --help          Show this help
>>>
>>> Environment:
>>>     SIGN_OFF_NAME       Override git user.name for Signed-off-by
>>>     SIGN_OFF_EMAIL      Override git user.email for Signed-off-by
>>>     OUTPUT_DIR          Build output directory
>>>
>>> Through make:
>>>     SYNC_HEADERS_ARGS   Options to pass to this script, e.g.:
>>>                         make -C tools/perf sync-headers SYNC_HEADERS_ARGS='-n'
>>>
>>> The script:
>>>     1. Runs 'make -C tools/perf check-headers' to find stale copies.
>>>     2. For each stale header, identifies the kernel commits that changed it,
>>>        including the merges that brought content of their own.
>>>     3. Copies the kernel header into the tools/ tree, skipping it when only
>>>        the tools/ copy changed (it is ahead) or when it carries intentional
>>>        edits, and stopping for manual investigation when both sides have
>>>        content the other lacks.
>>>     4. For beauty headers, runs the relevant beauty script(s) before and
>>>        after, showing new/changed string table entries.
>>>     5. Builds perf and the other consumers of the header to verify nothing
>>>        breaks.
>>>     6. Creates a git commit per header (or group) with the standard commit
>>>        message format.
> 
>>> acme@number:~/git/perf-tools-next$
> 
>>> I.e. the limitation in point number three, about intentional edits, needs to be lifted.
>   
>> Oh nice I hadn't noticed sync-headers.sh. What's the plan to support tools
>> side edits? Something like exporting the kernel change as a patch and trying
>> to apply it on top of the tools copy? Or I suppose you could do it the other
>> way around and try to apply the tools diff on top of a new clean kernel
>> copy.
> 
> I think the script should diff the current state, save that, copy the
> new header, apply the patch to get the perf tools changes, then ask
> opencode (or the coding agent used most frequently by the developer) to

Interesting, didn't think about having an agent invoked from the script. 
Despite what people say about them being unreliable, for things like 
resolving conflicts and digging out commit messages to add context to 
the resolutions, I find them much more reliable than myself. And faster 
as well.

> check if what was done is sensible, then ask the developer to do a last
> check and amends, sign off and commit.
> 
> Just like the following one, that I used to send the first fixes pull
> req for this merge window to Linus, he accepted it straight away, so
> brownie points to it (or to me + opencode + DeepSeek V4 (or was it Qween
> Flash free? or... unsure :-))):
> 
> acme@number:~/git/perf-tools-next$ cat ../perf-dev-scripts/perf-upstream-tag.sh
> #!/bin/bash
> # SPDX-License-Identifier: GPL-2.0
> #
> # Prepare a signed tag for a pull request to Linus from the perf
> # tools tree.
> #
> # The merge window is derived from the latest tag in Linus' tree:
> #
> #   - vN.M-rcK: the release in progress is vN.M,
> #   - vN.M:     no -rc1 for the next window was out yet, so the merge
> #               window is vN.(M+1).
> #
> # If no perf-tools-for-vN.M tag exists yet for the current merge
> # window, this is the merge window pull request and the tag will be
> # perf-tools-for-vN.M-<seq>-<date>; otherwise it is a fixes pull
> # request and the tag will be perf-tools-fixes-for-vN.M-<seq>-<date>,
> # where vN.M is the release Linus is building.
> #
> # In two steps, the way git does commit messages:
> #
> #   1. Run without --continue. The programmatic parts happen here:
> #      fetch, find the latest Linus tag, decide for vs fixes, compute
> #      the tag name, get the commits not upstream via git cherry.
> #      Their full commit texts then go, with the style rules and the
> #      latest tag message as an example, to a coding agent (opencode
> #      or claude, whichever is available and not disabled) to produce
> #      the succinct grouped summary; without an agent it falls back
> #      to one bullet per commit subject. The message is written to
> #      $GIT_DIR/UPSTREAM_TAG_EDITMSG, like git's COMMIT_EDITMSG and
> #      TAG_EDITMSG, for the maintainer to review and amend.
> #   2. After editing, run with --continue: it checks that the branch
> #      tip didn't move, that a GPG secret key is available, picks the
> #      key used in the latest signed tag made by this maintainer
> #      (overridable with -k), and creates the signed tag.
> #
> # Usage: perf-upstream-tag.sh [options]
> #
> # Options:
> #   -r, --torvalds-remote R  Remote for Linus' tree (default: torvalds)
> #   -b, --branch REF         Branch to be pulled (default: perf-tools)
> #   -u, --push-remote R      Remote with the public tree, for the
> #                            push/request-pull hints (default: acme,
> #                            falling back to origin)
> #   -k, --key KEYID          GPG key for signing (default: the key
> #                            used in the latest signed tag made by
> #                            the current maintainer)
> #       --agent NAME         Coding agent for the summary: opencode,
> #                            claude or none (default: auto-detect)
> #       --continue           Create the signed tag from the message
> #                            written by a previous run
> #   -n, --dry-run            Print the plan, write nothing
> #       --no-fetch           Do not fetch the Linus remote first
> #   -h, --help               This help
> 
> set -euo pipefail
> 
> die() { echo "perf-upstream-tag: $*" >&2; exit 1; }
> 
> torvalds=torvalds
> branch=perf-tools
> push_remote=
> agent=auto
> key=
> mode=draft
> dry_run=0
> do_fetch=1
> 
> while [ $# -gt 0 ]; do
> 	case "$1" in
> 	-r|--torvalds-remote) torvalds=$2; shift 2 ;;
> 	-b|--branch)          branch=$2; shift 2 ;;
> 	-u|--push-remote)     push_remote=$2; shift 2 ;;
> 	-k|--key)             key=$2; shift 2 ;;
> 	--agent)              agent=$2; shift 2 ;;
> 	--no-agent)           agent=none; shift ;;
> 	--continue)           mode='continue'; shift ;;
> 	-n|--dry-run)         dry_run=1; shift ;;
> 	--no-fetch)           do_fetch=0; shift ;;
> 	-h|--help)            sed -n '2,/^set /{ /^set /d; /^#!/d; s/^# \{0,1\}// p }' "$0"; exit 0 ;;
> 	*) die "unknown option: $1" ;;
> 	esac
> done
> 
> gitdir=$(git rev-parse --absolute-git-dir) || die "not in a git tree"
> editmsg="$gitdir/UPSTREAM_TAG_EDITMSG"
> plan="$gitdir/UPSTREAM_TAG_PLAN"
> [ -n "$push_remote" ] || push_remote=$(git remote | grep -x acme || echo origin)
> 
> if [ "$mode" = continue ]; then
> 	# Step 2: sign the message the maintainer left in UPSTREAM_TAG_EDITMSG.
> 	[ -f "$plan" ]    || die "no $plan, run without --continue first"
> 	[ -f "$editmsg" ] || die "no $editmsg, nothing to sign"
> 	# shellcheck source=/dev/null
> 	. "$plan"
> 
> 	tip=$(git rev-parse --verify "$BRANCH_REF" 2>/dev/null) || \
> 		die "branch $BRANCH_REF is gone"
> 	[ "$tip" = "$SHA" ] || \
> 		die "branch tip moved from $SHA to $tip, rerun without --continue"
> 	git rev-parse -q --verify "refs/tags/$TAG" >/dev/null && \
> 		die "tag $TAG already exists"
> 
> 	secret=$(gpg --list-secret-keys --with-colons 2>/dev/null | awk -F: '$1 == "sec" { print $5 }')
> 	[ -n "$secret" ] || die "no GPG secret key on $(hostname):
>    the message is at $editmsg, the tag name in $plan.
>    Run --continue on the machine holding your key, or
>    pass --key when the key is in another GnuPG home"
> 
> 	if [ -z "$key" ]; then
> 		# The key this maintainer used in the latest signed tag.
> 		email=$(git var GIT_COMMITTER_IDENT | sed -E 's/.*<([^>]*)>.*/\1/')
> 		for t in $(git for-each-ref --sort=-creatordate --format='%(refname:lstrip=2)' \
> 			   refs/tags/perf-tools-*); do
> 			te=$(git for-each-ref "refs/tags/$t" --format='%(taggeremail)' | tr -d '<>')
> 			case "$te" in *$email) ;; *) continue ;; esac
> 			line=$(git tag -v "$t" 2>&1 | sed -n 's/.*using [A-Z]* key \([0-9A-F]\{16,\}\).*/\1/p' | head -1 || true)
> 			if [ -n "$line" ]; then key=$line; break; fi
> 		done
> 	fi
> 	if [ -n "$key" ]; then
> 		echo "Signing $TAG with key $key"
> 		git tag -s -u "$key" -F "$editmsg" "$TAG" "$SHA"
> 	else
> 		echo "No previously signed tag by $email, using the default key"
> 		git tag -s -F "$editmsg" "$TAG" "$SHA"
> 	fi
> 	rm -f "$plan"
> 	echo
> 	echo "Push and send the pull request:"
> 	echo
> 	# shellcheck disable=SC2153  # PUSH_REMOTE comes from the sourced plan
> 	echo "  git push $PUSH_REMOTE $BRANCH_REF refs/tags/$TAG"
> 	echo "  git request-pull $LATEST_TAG <public tree url> $TAG"
> 	exit 0
> fi
> 
> # Step 1: figure out what the pull request is and draft its message.
> refname=
> for r in "refs/heads/$branch" "refs/remotes/$branch"; do
> 	if git rev-parse -q --verify "$r" >/dev/null; then refname=$r; break; fi
> done
> [ -n "$refname" ] || die "branch '$branch' not found"
> sha=$(git rev-parse --verify "$refname")
> 
> if [ "$do_fetch" = 1 ]; then
> 	git fetch --quiet --tags "$torvalds" || die "cannot fetch from '$torvalds', use --no-fetch"
> fi
> 
> latest=$(git for-each-ref --sort=-creatordate --format='%(refname:lstrip=2)' "refs/tags/v*" |
> 	grep -E '^v[0-9]+\.[0-9]+(-rc[0-9]+)?$' | head -1 || true)
> [ -n "$latest" ] || die "no vN.M(-rcK) tag found in the local tag list"
> 
> if [ "$latest" = "${latest%-rc*}" ]; then
> 	version=${latest#v}
> 	dev_version=$version
> 	window="$(( ${version%%.*} )).$(( ${version##*.} + 1 ))"
> 	rc=
> else
> 	dev_version=${latest#v}; dev_version=${dev_version%-rc*}
> 	window=$dev_version
> 	rc=${latest##*-}
> fi
> 
> upstream_ref=$(git for-each-ref --format='%(refname)' "refs/remotes/$torvalds/master")
> [ -n "$upstream_ref" ] || die "no refs/remotes/$torvalds/master"
> 
> if [ -n "$(git for-each-ref --format='%(refname:lstrip=2)' "refs/tags/perf-tools-for-v${window}*")" ]; then
> 	kind=fixes
> else
> 	kind=merge-window
> fi
> 
> if [ "$kind" = fixes ]; then
> 	target=$dev_version
> 	pattern="perf-tools-fixes-for-v${target}"
> 	title="perf tools fixes for v${target}"
> else
> 	target=$window
> 	pattern="perf-tools-for-v${window}"
> 	title="perf tools changes for v${window}"
> fi
> n=$(git for-each-ref --format='%(refname:lstrip=2)' "refs/tags/${pattern}*" |
>      grep -c . || true)
> seq=$((n + 1))
> date=$(date +%F)
> tag="${pattern}-${seq}-${date}"
> 
> git rev-parse -q --verify "refs/tags/$tag" >/dev/null && die "tag $tag already exists"
> 
> # Commits not upstream: cherry by patch-id, so commits already merged
> # upstream by another route are skipped.
> mapfile -t shas < <(git cherry -v "$upstream_ref" "$sha" | grep '^+' | cut -d' ' -f2 | tac)
> count=${#shas[@]}
> [ "$count" -gt 0 ] || die "$branch has nothing beyond $upstream_ref"
> 
> committer=$(git var GIT_COMMITTER_IDENT | sed -E 's/(<[^>]*>).*/\1/')
> 
> if [ "$dry_run" = 1 ]; then
> 	echo "dry run: tag $tag, $count commit(s), message not written"
> 	exit 0
> fi
> 
> printf 'TAG=%q\nSHA=%q\nBRANCH_REF=%q\nLATEST_TAG=%q\nPUSH_REMOTE=%q\n' \
> 	"$tag" "$sha" "$refname" "$latest" "$push_remote" > "$plan"
> 
> # The last tag message of the same kind, minus the signature, is the
> # style example handed to the agent.
> example_sha=$(git for-each-ref --sort=-creatordate --format='%(objectname)' \
> 	"refs/tags/${pattern}-*" | head -1 || true)
> if [ -z "$example_sha" ]; then
> 	example_sha=$(git for-each-ref --sort=-creatordate --format='%(objectname)' \
> 		'refs/tags/perf-tools-for-v*' | head -1 || true)
> fi
> if [ -n "$example_sha" ]; then
> 	example=$(git cat-file tag "$example_sha" 2>/dev/null |
> 		sed -n '/^$/,$p' | sed '1d;/-----BEGIN PGP/,$d')
> else
> 	example=''
> fi
> 
> commits=$(git show -s --format='%s%n%n%b' "${shas[@]}")
> 
> agent_cmd=
> case "$agent" in
> 	auto)
> 		for a in opencode claude; do
> 			if command -v "$a" >/dev/null 2>&1; then agent_cmd=$a; break; fi
> 		done
> 		;;
> 	none) ;;
> 	*) if command -v "$agent" >/dev/null 2>&1; then agent_cmd=$agent; else
> 		   die "agent '$agent' not found"; fi ;;
> esac
> 
> body=
> if [ -n "$agent_cmd" ]; then
> 	# Quoted heredoc for the fixed text: commit messages contain $ and
> 	# backticks that must never be expanded.
> 	prompt=$(
> 		cat <<'RULES'
> You are summarizing Linux perf commits for a maintainer's signed
> pull request tag message. Output ONLY the bullet block: no title
> line, no Signed-off-by, no fences, no preamble.
> 
> Rules:
> - Bullet items start with "- ", continuation lines are indented
>    two spaces, text wraps near 74 columns.
> - AT MOST two lines per bullet, shorter than the example: name the
>    area or subcommand, say what the change does, and stop.  No
>    function names, no ioctl numbers, no error strings, no lists of
>    affected machines or file paths beyond a few header names.
> - One item per group, never one per commit: fold the header sync
>    commits into a single item naming the headers; group the rest by
>    area (symbol resolution, build, tests) or by subcommand (record,
>    report, trace, top, kvm, jitdump, jevents, ...). New features
>    first, then fixes, then cleanups.
> - Succinct commentary on what the changes do, written from the full
>    commit texts, not just the subjects. No diffstats, no review
>    history, no walls of text.
> 
> Example, the latest tag message of this kind in this tree:
> 
> RULES
> 		printf '%s\n' "${example:-none available}"
> 		printf '\nCommits to summarize (%d commits):\n\n' "$count"
> 		printf '%s\n' "$commits"
> 	)
> 	if body=$(printf '%s' "$prompt" | timeout 600 "$agent_cmd" run 2>/dev/null || \
> 		 printf '%s' "$prompt" | timeout 600 "$agent_cmd" -p 2>/dev/null) && \
> 	   [ -n "$body" ]; then
> 		echo "Summary drafted by: $agent_cmd"
> 	else
> 		body=
> 		echo "agent '$agent_cmd' failed, falling back to subject bullets" >&2
> 	fi
> fi
> 
> if [ -z "$body" ]; then
> 	body=$(printf '%s\n' "${shas[@]}" | xargs -rn1 git show -s --format='- %s')
> fi
> 
> # The script adds the title and the trailer itself; drop them if the
> # agent echoed them anyway, plus leading/trailing/double blank lines.
> body=$(printf '%s\n' "$body" | awk -v title="$title" '
> 	/^Signed-off-by:/ { next }
> 	$0 == title       { next }
> 	NF == 0           { blank = 1; next }
> 	{ if (seen && blank) print ""; seen = 1; blank = 0; print }')
> 
> {
> 	printf '%s\n\n' "$title"
> 	printf '%s\n\n' "$body"
> 	printf 'Signed-off-by: %s\n' "$committer"
> } > "$editmsg"
> 
> echo "Latest Linus tag:   $latest${rc:+ ($rc in the v${dev_version} cycle)}"
> echo "Merge window:       v$window, tag for it: $( [ "$kind" = fixes ] && echo "perf-tools-for-v$window exists" || echo "none yet")"
> echo "Tag to be created:  $tag -> $sha"
> echo "Not upstream:       $count commit(s)"
> echo
> echo "Message written to: $editmsg"
> echo "Review and amend it, then create the signed tag:"
> echo
> echo "  $0 --continue"
> acme@number:~/git/perf-tools-next$
> 
> My plan is to have this in tools/perf/scripts/ so that whoever comes
> after me and Namhyung, if this ends up being needed, don't have to go
> thru such boring processes that were not automated due to lack of time
> even being in my mind since forever as tech debt :-\ :-)
> 

This feels like its turning email into an API that you can attach any 
front end to. I wonder if it would give websites like github any ideas 
to add a "send as a signed linux PR" button :D

It's a great documentation of the actual process which despite all the 
documentation is not always that obvious how to do in practice.

> - Arnaldo

